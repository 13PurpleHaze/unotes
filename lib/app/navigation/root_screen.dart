import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notesapp/app/navigation/bottom_nav_bar.dart';
import 'package:notesapp/app/navigation/tab_item.dart';

class RootScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const RootScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          navigationShell,
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: BottomNavBar(
              onTabChange: (int index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
              activeIndex: navigationShell.currentIndex,
              tabs: const [
                TabItem(text: 'Notes', icon: Icon(Icons.edit)),
                TabItem(text: 'Tasks', icon: Icon(Icons.done))
              ],
            ),
          )
        ],
      ),
    );
  }
}
