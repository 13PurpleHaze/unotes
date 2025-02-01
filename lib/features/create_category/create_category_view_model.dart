import 'package:flutter/material.dart';
import 'package:notesapp/features/categories/category_repository.dart';
import 'package:notesapp/features/notes/note_repository.dart';

class CreateCategoryViewModel extends ChangeNotifier {
  final CategoryRepository categoryRepository;

  CreateCategoryViewModel({required this.categoryRepository});

  void createNote(String title, int color) {
    categoryRepository.addCategory(title, color);
  }
}
