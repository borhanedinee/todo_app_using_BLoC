import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/data/repositpry/home_repo.dart';
import 'package:todos/domain/models/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository taskRepository;
  HomeBloc({required this.taskRepository}) : super(HomeInitial()) {
    on<FetchHomeDataEvent>(fetchHomeData);
    on<SortByChanged>(sortByChanged);
  }

  FutureOr<void> fetchHomeData(event, emit) async {
    emit(HomeLoading());
    await Future.delayed(
      const Duration(seconds: 12),
    );
    try {
      var response = await taskRepository.fetchTask(event.userId);
      emit(
        HomeLoaded(
          onGoingCount: response['onGoingCount'],
          inProgressCount: response['inProgressCount'],
          pendingCount: response['pendingCount'],
          completedCount: response['completedCount'],
          recentTaks: response['tasks'],
        ),
      );
    } catch (e) {
      emit(
        HomeError(
          error: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> sortByChanged(
      SortByChanged event, Emitter<HomeState> emit) async {
    //TODO: handle changedsort by event
    try {
      List<Task> sortedTasks = await taskRepository.sortTask(event.sortBy);
      HomeLoaded statee = state as HomeLoaded;
      emit(statee.copyWith(recentTasks: sortedTasks));
    } catch (e) {}
  }
}
