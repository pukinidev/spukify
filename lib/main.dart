import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spukify/screens/auth_view/signup_view.dart';
import 'package:spukify/screens/home_view/home_view.dart';
import 'package:spukify/screens/profile_view/profile_view.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:spukify/constants/theme.dart';
import 'package:spukify/screens/auth_view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late StreamSubscription<User?> user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
        
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
      routes: {
        '/home':(context) => const HomeScreen(),
        '/login':(context) => const LoginScreen(),
        '/signup':(context) => const SignUpScreen(),
        '/profile':(context) => const ProfileScreen(),
      },
    );
  }
}
