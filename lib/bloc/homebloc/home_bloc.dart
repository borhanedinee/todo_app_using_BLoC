import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/data/repositpry/home_repo.dart';
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository taskRepository;
  HomeBloc({required this.taskRepository}) : super(HomeInitial()) {
    on<FetchHomeDataEvent>(fetchHomeData);
    on<SortByChanged>(sortByChanged);
    on<DeleteTask>(deleteTask);
  }

  FutureOr<void> fetchHomeData(event, emit) async {
    emit(HomeLoading());

    await Future.delayed(
      const Duration(seconds: 3),
    );

    try {
      var response = await taskRepository.fetchTask(event.userId);
      emit(
        HomeLoaded(
          currentSortByStatus: 'Sort By',
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
    emit(SortbyLoading());
    await Future.delayed(const Duration(seconds: 3));
    //TODO: handle changedsort by event
    try {
      Map sortedTasks = await taskRepository.sortTask(event.sortBy);
      emit(
        HomeLoaded(
          currentSortByStatus: event.sortBy,
          onGoingCount: sortedTasks['onGoingCount'],
          inProgressCount: sortedTasks['inProgressCount'],
          pendingCount: sortedTasks['pendingCount'],
          completedCount: sortedTasks['completedCount'],
          recentTaks: sortedTasks['tasks'],
        ),
      );
    } catch (e) {
      logger.e(e.toString());
    }
  }

  FutureOr<void> deleteTask(DeleteTask event, Emitter<HomeState> emit) async {
    try {
      var response = await taskRepository.deleteTask(event.taskId);
      emit(DeletedTaskState(status : response));
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
