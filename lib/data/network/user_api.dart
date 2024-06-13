import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todos/utils/constants.dart';

class UserAPI {
  //ADD USER
  static Future<dynamic> addUser(map)async{
    try {
      print('123123123');
      var result = await http.post(
        Uri.parse('${Constants.baseUrl}/api/adduser/'),
        body: json.encode(map),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
        },
      );
      
      print(result.body);
      Map resultConverted = jsonDecode(result.body);
      if (result.statusCode == 200) {
        return resultConverted;
      }
    } catch (e) {
      throw(e.toString());
    }
  }
  //LOG IN
  static Future<dynamic> logUserIn(map) async {
    try {
      var result = await http.post(
        Uri.parse('${Constants.baseUrl}/api/getuser/'),
        body: json.encode(map),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
        },
      );
      Map<String, dynamic> resultConverted = jsonDecode(result.body);
      if (result.statusCode == 200) {
        return resultConverted;
      }
    } catch (e) {
      throw(e.toString());
    }
  }
}
