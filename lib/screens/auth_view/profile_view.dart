import 'package:flutter/material.dart';
import 'package:spukify/constants/theme.dart';
import 'package:spukify/global/custom_appbar.dart';
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  AuthService().signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login',
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
