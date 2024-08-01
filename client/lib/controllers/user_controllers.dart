import 'package:client/models/user.dart';
import 'package:client/models/user_login.dart';
import 'package:client/service/service.dart';

Service userService = Service();

Future<List<User>?> getAllUser() async {
  print("getting data");
  try {
    final result = await userService.get("user");
    print(result);
    List<User>? user = User.parseJsonToList(result);
    return user;
  } catch (e) {
    print("Error $e");
    return null;
  }
}

Future<User?> authenticateUser(String email, String password) async {
  try {
    UserLogin userLogin = UserLogin(email: email, password: password);
    final result = await userService.post<UserLogin>("user", userLogin);
    User? user = User.parseJson(result);
    print(user);
    return user;
  } catch (e) {
    print("Error: $e");
    return null;
  }
}
