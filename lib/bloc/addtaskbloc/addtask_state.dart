part of 'addtask_bloc.dart';

@immutable
sealed class AddtaskState {}

final class AddtaskInitial extends AddtaskState {}

final class AddTaskLoading extends AddtaskState {}

final class AddTaskSuccess extends AddtaskState {}
final class AddTaskError extends AddtaskState {
  final error;
  AddTaskError(this.error);
}
