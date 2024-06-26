import 'package:flutter/material.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:spukify/constants/theme.dart';

class Logo extends StatelessWidget {

  
  const Logo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60),
      alignment: Alignment.center,
      child: const GradientIcon(
        icon: Icons.music_note_outlined,
        gradient: LinearGradient(
          colors: [
            primaryColor,
            secondaryColor,
          ],
          begin: Alignment(1, -1),
          end: Alignment(1, 1),
        ),
        size: 140,
      ),
    );
  }
}

// AppTitle
// Baguettify -> Super Awesome Name
class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        'SPUKIFY',
        style: TextStyle(
          fontSize: 66,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
          letterSpacing: 4,
          foreground: Paint()..shader = titlelinearGradient,
        ),
      ),
    );
  }
}

// CustomUserFieldForm
class CustomUserFieldForm extends StatelessWidget {
  const CustomUserFieldForm(
      {super.key,
      required this.emailcontroller,
      required this.passwordcontroller,
      required this.togglePasswordVisibility,
      required this.passwordvisibility});

  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  final Function()? togglePasswordVisibility;
  final bool passwordvisibility;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: emailcontroller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordcontroller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: togglePasswordVisibility,
                  icon: Icon(
                      passwordvisibility
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: passwordvisibility ? Colors.white : Colors.grey),
                ),
              ),
              obscureText: !passwordvisibility,
              keyboardType: TextInputType.visiblePassword,
            ),
          ],
        ),
      ),
    );
  }
}

// GradientButton
class GradientButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
