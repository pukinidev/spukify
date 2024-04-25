import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spukify/constants/theme.dart';
import 'package:spukify/global/custom_appbar.dart';
import 'package:spukify/global/custom_bottomnav.dart';
import 'package:spukify/services/auth/auth_service.dart';

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
      bottomNavigationBar: const CustomBottomNav(),
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: gradient,
          ),
          child: Center(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 90),
                Row(
                  children: [
                    Text(
                      "Trending 🔥",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RobotoBlack',
                              ),
                    ),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        text: "See all",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RobotoBlack',
                              fontSize: 16,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to see all trending
                          },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    AuthService().signOut();
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text("Sign Out"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
