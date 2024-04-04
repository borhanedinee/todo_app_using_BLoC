import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todos/domain/models/task.dart';
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

  //fetch tasks
  static fetchTask(userId) async {
    try {
      var req = await http.post(
        Uri.parse(
          '${Constants.baseUrl}/api/tasks/fetchtask/',
        ),
        body: json.encode(userId),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
        },
      );
      if (req.statusCode == 200) {
        //TODO: make sure of the type of the response here
        //TODO: i expect it to be list of json 
        var response = json.decode(req.body).toList();
        return response;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  
}
