import 'dart:convert';

class User {
  final String id;
  final String email;
  final String password;

  User({required this.id, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['Id'], email: json['Email'], password: json['Password']);
  }

  static User? parseJson(String jsonString) {
    try {
      final jsonData = json.decode(jsonString);
      return User.fromJson(jsonData);
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }

  static List<User>? parseJsonToList(String jsonString) {
    try {
      final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
      return parsed.map<User>((json) => User.fromJson(json)).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
