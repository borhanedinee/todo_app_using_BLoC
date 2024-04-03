import 'package:todos/data/network/task_api.dart';
import 'package:todos/domain/models/task.dart';

class TaskRepository {

  //FETCH TASKS BY USER ID
  fetchTask(userId) async {
    try {
      var response = await TaskAPI.fetchTask(userId);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  //ADD TASK
  addTask(Task task)async{
    try {
      var response = await TaskAPI.addTask(task);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}