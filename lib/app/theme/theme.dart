import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  splashColor: Color.fromARGB(70, 104, 89, 217),
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

final darkTheme = ThemeData(
  useMaterial3: true,
  splashColor: Color.fromARGB(70, 104, 89, 217),
  scaffoldBackgroundColor: const Color.fromARGB(255, 52, 55, 66),
  navigationDrawerTheme: NavigationDrawerThemeData(
    backgroundColor: const Color.fromARGB(255, 52, 55, 66),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 52, 55, 66),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: const Color.fromARGB(255, 52, 55, 66),
  ),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 104, 89, 217),
    primary: Color.fromARGB(255, 111, 215, 186),
    secondary: Colors.white,
    tertiary: Color.fromARGB(255, 233, 115, 170),
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
