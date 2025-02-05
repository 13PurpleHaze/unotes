import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';

import 'package:notesapp/app/navigation/navigation.dart';

class RootScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const RootScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      body: navigationShell,
      extendBody: true,
      bottomNavigationBar: BottomNavBar(
        onTabChange: (int index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        activeIndex: navigationShell.currentIndex,
        tabs: const [
          TabItem(text: 'Notes', icon: Icon(Icons.edit)),
          TabItem(
            text: 'Tasks',
            icon: Icon(Icons.done),
          )
        ],
      ),
    );
  }
}
