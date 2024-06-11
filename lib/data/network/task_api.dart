import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';
import 'package:todos/utils/constants.dart';

class TaskAPI {
  //DELETE TASK
  static deleteTask(int taskId) async {
    try {
      var req = await http.post(
        Uri.parse('${Constants.baseUrl}/api/tasks/deletetask/'),
        body: jsonEncode({'taskId': taskId}),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
        },
      );
      if (req.statusCode == 200) {
        logger.i('task deleted successfully');
        return 'success';
      } else {
        return 'error';
      }
    } catch (e) {
      return 'error';
    }
  }

  //ADD TASK
  static addTask(Task task, selectedDays) async {
    try {
      var req = await http.post(
        Uri.parse('${Constants.baseUrl}/api/tasks/addtask/'),
        body: jsonEncode({'task': task, 'selectedDays': selectedDays}),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
        },
      );
      if (req.statusCode == 200) {
        logger.i('task added successfully');
      } else {
        throw req.body;
      }
    } catch (e) {
      throw e;
    }
  }

  //UPDATE TASK
  static updateTask(Task task, selectedDays) async {
    try {
      var req = await http.post(
        Uri.parse('${Constants.baseUrl}/api/tasks/updatetask/'),

        // body: jsonEncode({'task' : task , 'selectedDays': selectedDays}),
        body: jsonEncode({
          "task_id": task.taskId,
          "task_title": task.taskTitle,
          "task_details": task.taskDetails,
          "task_category": task.taskCategory,
          "task_status": task.taskStatus,
          "task_deadline": task.taskDeadline
        }),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
        },
      );
      if (req.statusCode == 200) {
        logger.i('task added successfully');
      } else {
        throw req.body;
      }
    } catch (e) {
      throw e;
    }
  }

  //sort tasks
  static sortTask(sortBy) async {
    try {
      var req = await http.post(
        Uri.parse(
          '${Constants.baseUrl}/api/tasks/sortTasks/',
        ),
        body: json.encode({'sortBy': sortBy, 'userid': prefs.getInt('userid')}),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
        },
      );
      if (req.statusCode == 200) {
        List<dynamic> response = json.decode(req.body);
        return response;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //fetch tasks
  static fetchTask(userId) async {
    try {
      var req = await http.post(
        Uri.parse(
          '${Constants.baseUrl}/api/tasks/fetchtask/',
        ),
        body: json.encode({
          'userId': userId,
        }),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
        },
      );
      print(req.statusCode);
      if (req.statusCode == 200) {
        var response = json.decode(req.body).toList();
        return response;
      }
    } catch (e) {
      print(e.toString() + 'helloooo');
    }
  }
}
