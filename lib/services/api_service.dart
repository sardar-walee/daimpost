import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'http://10.0.2.2:3000/api'); // Android emulator

  static Future<Map<String, dynamic>> post(String path, Map<String, dynamic> body, {bool auth = false}) async {
    final uri = Uri.parse('$baseUrl$path');
    final headers = <String, String>{'Content-Type': 'application/json'};

    if (auth) {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      if (token != null) headers['Authorization'] = 'Bearer $token';
    }

    final res = await http.post(uri, headers: headers, body: jsonEncode(body));
    final data = jsonDecode(res.body.isNotEmpty ? res.body : '{}');
    if (res.statusCode >= 200 && res.statusCode < 300) return data;
    throw Exception(data['message'] ?? 'Request failed (${res.statusCode})');
  }
}
