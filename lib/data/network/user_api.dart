import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todos/domain/models/user.dart';
import 'package:todos/utils/constants.dart';

class UserAPI {
  //LOG IN
  static Future<User?> logUserIn(User user) async {
    try {
      var result = await http.post(
        Uri.parse('${Constants.baseUrl}/user/login/'),
        body: json.encode(user),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
        },
      );
      if (result.statusCode == 200) {
        User user = User.fromJson(
          jsonDecode(result.body),
        );
        return user;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
