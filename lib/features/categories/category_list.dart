import 'package:flutter/material.dart';

import 'package:notesapp/features/categories/categories.dart';
import 'package:notesapp/features/create_category/create_category.dart';

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
                leading: const Icon(Icons.square),
                trailing: IconButton(
                  onPressed: () => widget.viewModel
                      .removeCategory(widget.viewModel.categoryList[index].id),
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(widget.viewModel.categoryList[index].title),
                iconColor: Color(widget.viewModel.categoryList[index].color),
              );
            },
            itemCount: widget.viewModel.categoryList.length + 1,
            separatorBuilder: (context, index) => const Divider()));
  }
}
