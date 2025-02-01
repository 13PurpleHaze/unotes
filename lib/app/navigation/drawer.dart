import 'package:flutter/material.dart';
import 'package:notesapp/features/categories/category_list.dart';
import 'package:notesapp/features/categories/category_list_view_model.dart';
import 'package:provider/provider.dart';

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

// ListView(padding: EdgeInsets.zero, children: [
//   Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         'CATEGORIES',
//         style: Theme.of(context).textTheme.titleMedium,
//       ),
//       TextButton(
//           onPressed: () => {},
//           child: Text(
//             'CHANGE',
//             style: Theme.of(context)
//                 .textTheme
//                 .titleMedium
//                 ?.copyWith(color: Colors.blue),
//           ))
//     ],
//   ),
//   const Divider(),
// Consumer<CategoryListViewModel>(
//     builder: (context, viewModel, child) => CategoryList(
//           viewModel: viewModel,
//         )),
// FilledButton(onPressed: () => {}, child: Text('CREATE NEW')),
