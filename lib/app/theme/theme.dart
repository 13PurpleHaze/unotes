import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    useMaterial3: true,
    splashColor: Color.fromARGB(57, 104, 89, 217),
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
      overlayColor: WidgetStateColor.resolveWith(
        (states) => Color.fromARGB(57, 104, 89, 217),
      ),
    )),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Color.fromARGB(255, 104, 89, 217),
      primary: Color.fromARGB(255, 104, 89, 217),
    ),
    primaryColor: Color.fromARGB(255, 104, 89, 217),
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: Colors.white));
