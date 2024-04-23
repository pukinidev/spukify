import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spukify/services/auth/authentication.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = AuthService().currentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Log in as $user'),
      ),
    );
  }
}
