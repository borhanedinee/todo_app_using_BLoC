import 'package:todos/data/network/task_api.dart';
import 'package:todos/domain/models/task.dart';

class HomeRepository {
  //FETCH TASKS BY USER ID
  fetchTask(userId) async {
    try {
      List response = await TaskAPI.fetchTask(userId);
      List<Task> tasks = response.map((e) => Task.fromJson(e)).toList();
      var onGoingCount = 0;
      var completedCount = 0;
      var inProgoressCount = 0;
      var pendingCount = 0;
      for (Task task in tasks) {
        switch (task.taskStatus!.toLowerCase()) {
          case 'on going':
            onGoingCount += 1;
            break;
          case 'completed':
            completedCount += 1;
            break;
          case 'pending':
            pendingCount += 1;
            break;
          case 'in progress':
            inProgoressCount += 1;
            break;
          default:
            null;
        }
      }
      return {
        'pendingCount': pendingCount,
        'onGoingCount': onGoingCount,
        'completedCount': completedCount,
        'inProgressCount': inProgoressCount,
        'tasks': tasks
      };
    } catch (e) {
      print(e.toString());
    }
  }

  //ADD TASK
  addTask(Task task) async {
    try {
      var response = await TaskAPI.addTask(task);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}