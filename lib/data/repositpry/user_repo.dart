import 'package:todos/data/network/user_api.dart';
import 'package:todos/domain/models/user.dart';

class UserRepository {
  // LOGIN USER
  Future<User?> loginUser(User user) async{
    try {
      var response = await UserAPI.logUserIn(user);
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}