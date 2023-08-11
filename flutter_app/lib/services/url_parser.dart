import 'dart:convert';
import 'package:http/http.dart' as http;

class UrlParser {
  Future<Map<String, dynamic>> parseUrl(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load video data');
    }
  }
}