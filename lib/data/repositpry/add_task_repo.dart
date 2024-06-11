import 'package:todos/data/network/task_api.dart';
import 'package:todos/domain/models/task.dart';

class AddTaskRepository {
  addTask(Task task , List<String> selectedDays) async {
    try {
      var response = await TaskAPI.addTask(task , selectedDays);
    } catch (e) {
      throw e;
    }
  }


  updateTask(Task task , List<String> selectedDays) async {
    try {
      var response = await TaskAPI.updateTask(task , selectedDays);
    } catch (e) {
      throw e;
    }
  }
}