import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    useMaterial3: true,
    splashColor: const Color.fromARGB(58, 255, 193, 7),
    highlightColor: const Color.fromARGB(58, 255, 193, 7),
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
      overlayColor: WidgetStateColor.resolveWith(
          (states) => Color.fromARGB(58, 255, 193, 7)),
    )),
    colorScheme: ColorScheme.fromSeed(
        surfaceTint: Color.fromARGB(58, 255, 193, 7),
        brightness: Brightness.light,
        seedColor: Color.fromARGB(255, 59, 51, 73),
        primary: Color.fromARGB(255, 59, 51, 73),
        primaryContainer: const Color.fromARGB(58, 255, 193, 7)),
    primaryColor: Color.fromARGB(255, 59, 51, 73),
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 59, 51, 73)));
