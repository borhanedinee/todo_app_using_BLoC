import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/data/repositpry/home_repo.dart';
import 'package:todos/domain/models/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository taskRepository;
  HomeBloc({required this.taskRepository}) : super(HomeInitial()) {
    on<FetchHomeDataEvent>((event, emit) async {
      emit(HomeLoading());
      await Future.delayed(
        const Duration(seconds: 8),
      );
      try {
        var response = await taskRepository.fetchTask(event.userId);
        print('brooooooo' + response.toString());
        emit(
          HomeLoaded(
            onGoingCount: response['onGoingCount'],
            inProgressCount: response['inProgressCount'],
            pendingCount: response['pendingCount'],
            completedCount: response['completedCount'],
            recentTaks: response['tasks'],
          ),
        );
        print('jkgagflagfgfljagfljgsfljge');
      } catch (e) {
        emit(
          HomeError(
            error: e.toString(),
          ),
        );
      }
    });
  }
}
