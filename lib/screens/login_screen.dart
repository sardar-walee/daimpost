import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final Function(Locale) onLanguageChange;

  const LoginScreen({super.key, required this.onLanguageChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daimpost Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("اختر الدور / Choose Role"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("👤 مستخدم / User"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("🚖 سائق / Driver"),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => onLanguageChange(const Locale('ar')),
              child: const Text("العربية"),
            ),
            ElevatedButton(
              onPressed: () => onLanguageChange(const Locale('en')),
              child: const Text("English"),
            ),
          ],
        ),
      ),
    );
  }
}


// Added by setup: login handler
Future<void> _handleLogin(String email, String password, context) async {
  try {
    await AuthService.login(email, password);
    // TODO: Navigate to home screen
    // Navigator.pushReplacementNamed(context, '/home');
  } catch (e) {
    // TODO: show error to user
    // print(e);
  }
}
