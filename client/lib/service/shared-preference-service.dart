import 'package:client/models/user.dart';
import 'package:client/service/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Service service = Service();

class SharedPreferenceService {
  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("UserId", userId);
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("UserId");
    return userId;
  }

  static Future<User?> getUser() async {
    final userId = await getUserId();

    if (userId == null) return null;

    final response = await service.get('user/$userId');
    User? user = User.parseJson(response);
    return user;
  }
}
