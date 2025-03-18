import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer(
      {super.key,
      required this.currentIndex,
      required this.onTap,
      required this.items});

  final int currentIndex;
  final void Function(int) onTap;
  final List<DrawerItem> items;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 10, bottom: 10),
            color: Theme.of(context).colorScheme.primary,
            width: double.infinity,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: items.length,
              itemBuilder: (context, index) => ListTile(
                selected: index == currentIndex,
                onTap: () {
                  onTap(index);
                },
                leading: items[index].icon,
                title: Text(
                  items[index].title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
          // ListTile(
          //   onTap: () => {context.go('/notes')},
          //   leading: Icon(Icons.edit),
          //   title: Text(
          //     'Notes',
          //     style: Theme.of(context).textTheme.titleLarge,
          //   ),
          // ),
          // ListTile(
          //   onTap: () => {context.go('/categories')},
          //   leading: Icon(Icons.window),
          //   title: Text(
          //     'My categories',
          //     style: Theme.of(context).textTheme.titleLarge,
          //   ),
          // ),
          // ListTile(
          //   onTap: () => {context.go('/settings')},
          //   leading: Icon(Icons.settings),
          //   title: Text(
          //     'Settings',
          //     style: Theme.of(context).textTheme.titleLarge,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class DrawerItem {
  const DrawerItem(
      {required this.title, required this.link, required this.icon});

  final String link;
  final String title;
  final Icon icon;
}
