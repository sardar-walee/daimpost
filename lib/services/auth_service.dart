import 'package:shared_preferences/shared_preferences.dart';
import 'api_service.dart';

class AuthService {
  static Future<void> login(String email, String password) async {
    final data = await ApiService.post('/auth/login', {'email': email, 'password': password});
    final token = data['token'];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<void> register(String name, String email, String password) async {
    final data = await ApiService.post('/auth/register', {'name': name, 'email': email, 'password': password});
    final token = data['token'];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }
}
