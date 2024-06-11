part of 'addtask_bloc.dart';

@immutable
sealed class AddtaskEvent {}

final class AddingTaskEvent extends AddtaskEvent {
  final Task task;
  final List<String> selectedDays;

  AddingTaskEvent({required this.task , required this.selectedDays});
}

final class UpdatingTaskEvent extends AddtaskEvent {
  final Task task;
  final List<String> selectedDays;

  UpdatingTaskEvent({required this.task , required this.selectedDays});
}
