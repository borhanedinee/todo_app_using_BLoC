part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchHomeDataEvent extends HomeEvent{
  final int userId;

  FetchHomeDataEvent({required this.userId});
}