part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class SortbyLoading extends HomeState {
  final int weekly;
  final int monthly;
  final int deadlined;
  final int alltasks;

  SortbyLoading({required this.weekly, required this.monthly, required this.deadlined, required this.alltasks});
}
final class DeletedTaskState extends HomeState {
  final String status;

  DeletedTaskState({required this.status});
}

final class HomeLoaded extends HomeState {
  final int weekly;
  final int monthly;
  final int deadlined;
  final int allTasks;

  final String currentSortByStatus;

  final List<Task> recentTaks;

  HomeLoaded({
    required this.weekly,
    required this.monthly,
    required this.deadlined,
    required this.allTasks,
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
