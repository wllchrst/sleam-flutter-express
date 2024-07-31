import 'package:client/models/user.dart';
import 'package:client/service/service.dart';

Service userService = Service<User>(User.fromJson);

Future<User?> authenticateUser(String email, String password) async {
  try {
    User user = await userService.getData("user");
    return user;
  } catch (e) {
    print("Error $e");
    return null;
  }
}
