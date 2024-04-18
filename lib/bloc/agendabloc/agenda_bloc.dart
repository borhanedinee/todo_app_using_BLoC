import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos/data/repositpry/agenda_repo.dart';
import 'package:todos/domain/models/task.dart';

part 'agenda_event.dart';
part 'agenda_state.dart';

class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  AgendaRepository agendaRepository ;
  AgendaBloc({
    required this.agendaRepository
  }) : super(AgendaInitial()) {
    on<FetchTasksOnSpecificDate>((event, emit) {
      
      emit(AgendaLoading());
      try {
        // TODO: fetch tasks
      } catch (e) {
        
      }
    });
  }
}
