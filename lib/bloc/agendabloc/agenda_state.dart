part of 'agenda_bloc.dart';

@immutable
sealed class AgendaState {}

final class AgendaInitial extends AgendaState {}

final class AgendaLoading extends AgendaState {}

final class AgendaLoaded extends AgendaState{
  final List<Task> tasksOnSpecificDate;
  AgendaLoaded({
    required this.tasksOnSpecificDate,
  });
}

final class AgendaError extends AgendaState{}
