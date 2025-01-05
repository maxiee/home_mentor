import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SupaEmailAuth(onSignInComplete: (response) {
        Navigator.of(context).pushReplacementNamed('/home');
      }, onSignUpComplete: (response) {
        Navigator.of(context).pushReplacementNamed('/home');
      }),
    );
  }
}
