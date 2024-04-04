part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final int onGoingCount;
  final int inProgressCount;
  final int pendingCount;
  final int completedCount;

  final List<Task> recentTaks;

  HomeLoaded({
    required this.onGoingCount,
    required this.inProgressCount,
    required this.pendingCount,
    required this.completedCount,
    required this.recentTaks,
  });
}

final class HomeError extends HomeState {
  final String error;

  HomeError({required this.error});
}