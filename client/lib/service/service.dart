import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {
  final String baseUrl = "http://localhost:3000/";

  Future<String> get(String url) async {
    try {
      final response = await http.get(Uri.parse(this.baseUrl + url));
      return response.body;
    } catch (e) {
      return "";
    }
  }

  Future<String> post<T>(String url, T dataBody) async {
    try {
      final body = jsonEncode((dataBody as dynamic).toJson());
      print(body);
      final response = await http.post(Uri.parse(baseUrl + url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: body);
      return response.body;
    } catch (e) {
      print(e);
      return "";
    }
  }
}
