import 'package:flutter/material.dart';
import 'package:spukify/screens/auth_view/login_view.dart';
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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Log in as $user'),
            ElevatedButton(
              onPressed: () {
                AuthService().signOut();
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      )
    );
  }
}
