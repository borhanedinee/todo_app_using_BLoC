part of 'agenda_bloc.dart';

@immutable
sealed class AgendaEvent {}

final class FetchTasksOnSpecificDate extends AgendaEvent {
  final String specificDate;

  FetchTasksOnSpecificDate({required this.specificDate});
}
