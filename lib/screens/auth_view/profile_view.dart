import 'package:flutter/material.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
            child: Row(
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 140,
                  color: Colors.white,
                ),
                const SizedBox(width: 40),
                //TO-DO: Change this text to a span with a gesture recognizer
                Text(
                  'Edit picture',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          const Form(
            child: Column(
              children: [
                Text('Features'),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              AuthService().signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false);
            },
            child: const Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}
