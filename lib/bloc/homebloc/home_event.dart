part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchHomeDataEvent extends HomeEvent{
  final int userId;

  FetchHomeDataEvent({required this.userId});
}

class SortByChanged extends HomeEvent{
  final String sortBy;
  SortByChanged({required this.sortBy});
}