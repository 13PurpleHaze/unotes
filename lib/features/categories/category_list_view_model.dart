import 'package:flutter/foundation.dart';

import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/categories/categories.dart';

class CategoryListViewModel extends ChangeNotifier {
  final CategoryRepository _categoryRepository;
  List<NoteCategory> _categoryList = [];

  CategoryListViewModel({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository;

  List<NoteCategory> get categoryList => _categoryList;

  void fetchCategoryList() async {
    final categoryList = await _categoryRepository.getCategoryList();
    _categoryList = categoryList;
    notifyListeners();
  }

  void removeCategory(int categoryId) {
    _categoryRepository.removeCategory(categoryId);
    fetchCategoryList();
  }
}
