import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';
import 'package:todos/utils/constants.dart';

class TaskAPI {
  //ADD TASK
  static addTask(Task task) async {
    var data = task.toJson();
    try {
      var req = await http.post(
        Uri.parse('${Constants.baseUrl}/api/tasks/addtask/'),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
        },
      );
      if (req.statusCode == 200) {
        var response = json.decode(req.body);
        print('insert id is ${response['insertedId']}');
        print('message is ${response['msg']}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //sort tasks
  static sortTask(sortBy)async{
    try {
      
      logger.i('u are hereeeeeeeee and $sortBy ');
      var req = await  http.post(
        Uri.parse(
          '${Constants.baseUrl}/api/tasks/sortTasks/',
        ),
        body: json.encode({
          'sortBy' : sortBy,
          'userid' : prefs.getInt('userid')
        }),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
        },
      );
      if(req.statusCode == 200){
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
          'userId' : userId,
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
