import 'package:todos/data/network/user_api.dart';

class UserRepository {
  // LOGIN USER
  Future<Map<String, dynamic>> loginUser(map) async{
    try {
      Map<String, dynamic> data = await UserAPI.logUserIn(map);
      return data;
    } catch (e) {
      print(e.toString());
    }
    return {};

  }
}