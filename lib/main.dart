import 'package:flutter/material.dart';
import 'package:notesapp/app/theme/brightness_view_model.dart';
import 'package:provider/provider.dart';

import 'package:notesapp/app/dependencies/dependencies.dart';
import 'package:notesapp/app/navigation/navigation.dart';
import 'package:notesapp/app/theme/theme.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MultiProvider(
    providers: dependencies,
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],
      theme: context.watch<BrightnessViewModel>().brightness == Brightness.dark
          ? darkTheme
          : lightTheme,
    );
  }
}
