import 'package:todos/data/network/task_api.dart';
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';

class HomeRepository {


  //DELETE TASK
  deleteTask(taskId) async {
    try {
      var response = await TaskAPI.deleteTask(taskId);
      return response;
    } catch (e) {
      print(e);
    }
  }


  
  //FETCH TASKS BY USER ID
  fetchTask(userId) async {
    try {
      List response = await TaskAPI.fetchTask(userId);
      List<Task> tasks = response.map((e) => Task.fromJson(e)).toList();
      var weekly = 0;
      var monthly = 0;
      var deadlined = 0;
      var allTasks = tasks.length;
      for (Task task in tasks) {
        switch (task.taskStatus!.toLowerCase()) {
          case 'weekly':
            weekly += 1;
            break;
          case 'monthly':
            monthly += 1;
            break;
          case 'deadlined':
            deadlined += 1;
            break;
          default:
            null;
        }
      }
      return {
        'weekly': weekly,
        'monthly': monthly,
        'deadlined': deadlined,
        'allTasks': allTasks,
        'tasks': tasks
      };
    } catch (e) {
      print(e.toString());
    }
  }

  //SORT TASKS
  sortTask(String sortBy) async {
    try {
      List response = await TaskAPI.sortTask(sortBy);

      List<Task> tasks = response.map((e) => Task.fromJson(e)).toList();
      var weekly = 0;
      var monthly = 0;
      var deadlined = 0;
      var allTasks = tasks.length;
      for (Task task in tasks) {
        switch (task.taskStatus!.toLowerCase()) {
          case 'weekly':
            weekly += 1;
            break;
          case 'monthly':
            monthly += 1;
            break;
          case 'deadlined':
            deadlined += 1;
            break;
          default:
            null;
        }
      }
      return {
        'weekly': weekly,
        'monthly': monthly,
        'deadlined': deadlined,
        'allTasks': allTasks,
        'tasks': tasks
      };
    } catch (e) {
      print(e.toString());
    }
  }
}
