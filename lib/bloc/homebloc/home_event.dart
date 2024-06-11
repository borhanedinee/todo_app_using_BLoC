part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchHomeDataEvent extends HomeEvent{
  final int userId;

  FetchHomeDataEvent({required this.userId});
}

class DeleteTask extends HomeEvent{
  final int taskId;

  DeleteTask({required this.taskId});
}



class SortByChanged extends HomeEvent{
  final String sortBy;
  SortByChanged({required this.sortBy});
}