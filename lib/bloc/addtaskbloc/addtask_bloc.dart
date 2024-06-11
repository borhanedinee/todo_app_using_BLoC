import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/data/repositpry/add_task_repo.dart';
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';
part 'addtask_event.dart';
part 'addtask_state.dart';

class AddtaskBloc extends Bloc<AddtaskEvent, AddtaskState> {
  AddTaskRepository addTaskRepository ;
  AddtaskBloc({required this.addTaskRepository}) : super(AddtaskInitial()) {
    on<AddingTaskEvent>(addTask);
    on<UpdatingTaskEvent>(updateTask);
  }

  FutureOr<void> addTask(event, emit) async{
    print('u hereeeee');
    emit(AddTaskLoading());
    await Future.delayed(Durations.extralong1);
    try { 
      logger.i('eeeeeeeey ' + event.task.taskDeadline!);
      var response = await addTaskRepository.addTask(event.task , event.selectedDays);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskError(e));
    }
  }

  //update task
  FutureOr<void> updateTask(event, emit) async{
    print('u hereeeee');
    emit(AddTaskLoading());
    await Future.delayed(Durations.extralong1);
    try { 
      logger.i('eeeeeeeey ' + event.task.taskDeadline!);
      var response = await addTaskRepository.updateTask(event.task , event.selectedDays);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskError(e));
    }
  }
}
