import 'package:flutter/material.dart';
import 'package:notesapp/app/widgets/animated_pressable.dart';
import 'package:notesapp/app/widgets/widgets.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My categories',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    if (widget.viewModel.isFetching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (widget.viewModel.isError) {
      return Center(
        child: Text('An error occurred'),
      );
    }
    if (widget.viewModel.categoryList.isEmpty) {
      return Center(
        child: Column(
          children: [
            Text(
              'There is nothing yet :((((',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Button(
                variant: ButtonVariant.tertiary,
                onPressed: () async {
                  var res = await showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          CreateCategoryDialog());
                  if (res != null) {
                    widget.viewModel.fetchCategoryList();
                  }
                },
                child: Text(
                  'CREATE NEW',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          itemBuilder: (context, index) {
            if (index == widget.viewModel.categoryList.length) {
              return Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Button(
                  variant: ButtonVariant.tertiary,
                  onPressed: () async {
                    await _showDialog(context: context);
                  },
                  child: Text(
                    'CREATE NEW',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black),
                  ),
                ),
              );
            }
            return AnimatedPressable(
              onTap: () => {
                _showDialog(
                    context: context,
                    categoryId: widget.viewModel.categoryList[index].id,
                    categoryTitle: widget.viewModel.categoryList[index].title,
                    categoryColor:
                        Color(widget.viewModel.categoryList[index].color))
              },
              color: Color(widget.viewModel.categoryList[index].color),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.viewModel.categoryList[index].title,
                          style: Theme.of(context).textTheme.titleMedium),
                      IconButton(
                          onPressed: () =>
                              _delete(widget.viewModel.categoryList[index].id),
                          icon: Icon(Icons.delete))
                    ]),
              ),
            );
          },
          itemCount: widget.viewModel.categoryList.length + 1,
          separatorBuilder: (context, index) => SizedBox(
            height: 8,
          ),
        ));
  }

  Future<void> _onRefresh() async {
    widget.viewModel.fetchCategoryList();
  }

  Future<void> _showDialog({
    required BuildContext context,
    int? categoryId,
    String? categoryTitle,
    Color? categoryColor,
  }) async {
    var category = await showDialog(
      context: context,
      builder: (BuildContext context) => CreateCategoryDialog(
        categoryId: categoryId,
        categoryTitle: categoryTitle,
        categoryColor: categoryColor,
      ),
    );
    if (category != null) {
      widget.viewModel.fetchCategoryList();
    }
  }

  void _delete(int categoryId) {
    widget.viewModel.removeCategory(categoryId);
  }
}
