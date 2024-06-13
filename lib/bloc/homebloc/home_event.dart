part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchHomeDataEvent extends HomeEvent {
  final int userId;

  FetchHomeDataEvent({required this.userId});
}

class DeleteTask extends HomeEvent {
  final int taskId;

  DeleteTask({required this.taskId});
}

class SortByChanged extends HomeEvent {
  final String sortBy;
  final int weekly;
  final int alltasks;
  final int monthly;
  final int deadlined;
  SortByChanged({
    required this.sortBy,
    required this.weekly,
    required this.monthly,
    required this.deadlined,
    required this.alltasks,
  });
}
