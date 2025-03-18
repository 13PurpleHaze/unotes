import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notesapp/app/navigation/navigation.dart';

class RootScreen extends StatelessWidget {
  RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;
  final List<DrawerItem> _drawerItems = [
    DrawerItem(title: 'Notes', link: '/notes', icon: Icon(Icons.edit)),
    DrawerItem(
        title: 'My categories', link: '/categories', icon: Icon(Icons.window)),
    DrawerItem(title: 'Settings', link: '/settings', icon: Icon(Icons.edit)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(
        items: _drawerItems,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
      body: navigationShell,
    );
  }
}
