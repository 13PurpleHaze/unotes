import 'package:flutter/material.dart';

import 'package:notesapp/features/categories/categories.dart';

class CreateCategoryViewModel extends ChangeNotifier {
  final CategoryRepository categoryRepository;

  CreateCategoryViewModel({required this.categoryRepository});

  void createCategory(String title, int color) {
    // TODO: мб тоже стоит добавить isFetching, isError, тогда прийдется создать какой-нибудь полноэкранный лоадер
    categoryRepository.addCategory(title, color);
  }

  void updateCategory(int categoryId, String? title, int? color) {
    categoryRepository.updateCategory(categoryId, title, color);
  }
}
