// Define theme constants for the app
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color.fromRGBO(115, 72, 170, 1);
const Color secondaryColor = Color.fromRGBO(69, 57, 214, 1);

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  textTheme: GoogleFonts.robotoTextTheme(),
);

final Shader titlelinearGradient = const LinearGradient(
  colors: <Color>[secondaryColor, primaryColor],
).createShader(const Rect.fromLTWH(120.0, 60.0, 200.0, 150.0));


const gradient = LinearGradient(
  colors: [
    secondaryColor,
    primaryColor,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);