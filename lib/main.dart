import 'package:flutter/material.dart';
import 'package:spukify/constants/theme.dart';
import 'package:spukify/screens/auth_view/login_view.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const LoginScreen(),
    );
  }
}
