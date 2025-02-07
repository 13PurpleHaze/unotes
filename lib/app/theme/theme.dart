import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  splashColor: Color.fromARGB(70, 104, 89, 217),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      side: WidgetStateProperty.all(
          const BorderSide(color: Colors.black, width: 2)),
      overlayColor: WidgetStateProperty.all(
        const Color.fromARGB(30, 164, 159, 202),
      ),
      elevation: WidgetStateProperty.all(5),
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Color.fromARGB(255, 104, 89, 217),
    primary: Color.fromARGB(255, 111, 200, 186),
    secondary: Colors.white,
    tertiary: Color.fromARGB(255, 233, 106, 170),
  ),
  primaryColor: Color.fromARGB(255, 104, 89, 217),
  fontFamily: 'Rubik',
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textTheme: const TextTheme(
      headlineSmall: TextStyle(fontWeight: FontWeight.w700),
      bodyLarge: TextStyle(fontWeight: FontWeight.w400)),
);
