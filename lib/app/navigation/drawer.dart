import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notesapp/features/categories/categories.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 70, left: 10, bottom: 10),
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        child: Text(
          'CATEGORIES',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Consumer<CategoryListViewModel>(
          builder: (context, viewModel, child) => CategoryList(
                viewModel: viewModel,
              )),
    ]));
  }
}
