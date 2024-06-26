import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spukify/constants/theme.dart';
import 'package:spukify/services/auth/auth_service.dart';
import 'package:spukify/widgets/auth/auth_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                'Login into your account',
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
                  final message = await AuthService().signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  if (message!.contains('Success')) {
                    await Navigator.of(context).pushReplacementNamed(
                      '/home',
                    );
                  }
                },
                gradient: gradient,
                height: 46.0,
                width: 121.0,
                borderRadius: BorderRadius.circular(30),
                child: const Text(
                  'Login',
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
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'Don\'t have an account? ',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                ),
                // To do: Check when leaving the screen, the textspan disappears
                TextSpan(
                  text: 'Sign Up',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: primaryColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: primaryColor,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(
                        context,
                        '/signup',  
                      );
                    },
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
