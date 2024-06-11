part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class SortbyLoading extends HomeState {}
final class DeletedTaskState extends HomeState {
  final String status;

  DeletedTaskState({required this.status});
}

final class HomeLoaded extends HomeState {
  final int onGoingCount;
  final int inProgressCount;
  final int pendingCount;
  final int completedCount;

  final String currentSortByStatus;

  final List<Task> recentTaks;

  HomeLoaded({
    required this.onGoingCount,
    required this.inProgressCount,
    required this.pendingCount,
    required this.completedCount,
    required this.recentTaks,
    required this.currentSortByStatus,
  });
}

final class SortByLoaded extends HomeState{
  final List<Task> sortedTasks;

  SortByLoaded({required this.sortedTasks});
}

final class TasksLoading extends HomeState{}


final class HomeError extends HomeState {
  final String error;

  HomeError({required this.error});
}
