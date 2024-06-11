import 'package:todos/data/network/user_api.dart';
import 'package:todos/domain/models/user.dart';

class UserRepository {
  // LOGIN USER
  Future<User?> loginUser(map) async{
    try {
      Map<String, dynamic> data = await UserAPI.logUserIn(map);
      if (data.containsKey('user')) {
        
      User user = User.fromJson(data['user']);
      return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;

  }
}