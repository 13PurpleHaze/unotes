import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notesapp/app/dependencies/dependencies.dart';
import 'package:notesapp/app/navigation/navigation.dart';
import 'package:notesapp/app/theme/theme.dart';

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

      // TODO: вынести тему и добавить темную
      theme: lightTheme,
    );
  }
}
