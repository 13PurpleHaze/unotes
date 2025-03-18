import 'package:flutter/material.dart';

class BrightnessViewModel extends ChangeNotifier {
  Brightness brightness = Brightness.light;

  void changeTheme() {
    brightness =
        brightness == Brightness.light ? Brightness.dark : Brightness.light;
    notifyListeners();
  }
}
