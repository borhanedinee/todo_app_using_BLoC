import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos/data/repositpry/task_repo.dart';
import 'package:todos/domain/models/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TaskRepository taskRepository;
  HomeBloc({required this.taskRepository}) : super(HomeInitial()) {
    on<FetchHomeDataEvent>((event, emit) async {
      emit(HomeLoading());
      Future.delayed(const Duration(seconds: 2));
      try {
        var tasks = await taskRepository.fetchTask(event.userId);
        emit(
          HomeLoaded(
            onGoingCount: tasks['onGoingCount'],
            inProgressCount: tasks['inProgressCount'],
            pendingCount: tasks['pendingCount'],
            completedCount: tasks['completedCount'],
            recentTaks:tasks['tasks'],
          ),
        );
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
