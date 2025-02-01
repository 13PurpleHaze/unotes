import 'package:flutter/material.dart';
import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/categories/category_list_view_model.dart';
import 'package:notesapp/features/categories/widgets/category_card.dart';
import 'package:notesapp/features/categories/widgets/create_category_dialog.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class CategoryList extends StatefulWidget {
  final CategoryListViewModel viewModel;
  const CategoryList({super.key, required this.viewModel});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 100),
            itemBuilder: (context, index) {
              if (index == widget.viewModel.categoryList.length) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FilledButton(
                        onPressed: () async {
                          var res = await showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  CreateCategoryDialog());
                          if (res != null) {
                            widget.viewModel.fetchCategoryList();
                          }
                        },
                        child: const Text('CREATE NEW')));
              }
              return ListTile(
                leading: const Icon(Icons.note),
                title: Text(widget.viewModel.categoryList[index].title),
                iconColor: Color(widget.viewModel.categoryList[index].color),
              );
            },
            itemCount: widget.viewModel.categoryList.length + 1,
            separatorBuilder: (context, index) => const Divider()));
  }
}
