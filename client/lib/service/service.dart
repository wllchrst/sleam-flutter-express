import 'package:http/http.dart' as http;
import 'dart:convert';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class Service<T> {
  final String baseUrl = "http://localhost:3000/";
  final JsonFactory<T> jsonFactory;

  Service(this.jsonFactory);

  Future<T> getData(String url) async {
    print("Getting data $url");
    final response = await http.get(Uri.parse(baseUrl + url));
    print(response.body);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonFactory(jsonResponse);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> postData(String url, T dataBody) {
    
  }

}
