import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spukify/constants/theme.dart';
import 'package:spukify/global/custom_appbar.dart';
import 'package:spukify/screens/auth_view/login_view.dart';
import 'package:spukify/services/auth/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Center(
          child: Container(
        decoration: const BoxDecoration(
          gradient: gradient,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: () {
                  AuthService().signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                },
                child: const Text("Sign Out"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
