import 'package:flutter/material.dart';

import 'package:notesapp/features/categories/categories.dart';

class CreateCategoryViewModel extends ChangeNotifier {
  final CategoryRepository categoryRepository;

  CreateCategoryViewModel({required this.categoryRepository});

  void createNote(String title, int color) {
    categoryRepository.addCategory(title, color);
  }
}
