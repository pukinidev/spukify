import 'package:flutter/material.dart';
import 'package:spukify/constants/theme.dart';
import 'package:spukify/services/auth/auth_service.dart';
import 'package:spukify/widgets/auth/auth_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool _passwordvisibility;

  @override
  void initState() {
    _passwordvisibility = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordvisibility = !_passwordvisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://github.com/pukinidev/spukify/blob/main/assets/background.png?raw=true'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Logo(),
              const AppTitle(),
              Text(
                'Create your account',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomUserFieldForm(
                  emailcontroller: _emailController,
                  passwordcontroller: _passwordController,
                  togglePasswordVisibility: _togglePasswordVisibility,
                  passwordvisibility: _passwordvisibility),
              const SizedBox(
                height: 30,
              ),
              GradientButton(
                onPressed: () async {
                  final message = await AuthService().signUp(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  if (message!.contains('Success')) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Account created successfully!'),
                      ),
                    );
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home',
                        (route) => false);
                  }
                },
                gradient: gradient,
                height: 46.0,
                width: 121.0,
                borderRadius: BorderRadius.circular(30),
                child: const Text(
                  'Create',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: const Text(
                  'Go back',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: primaryColor,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
