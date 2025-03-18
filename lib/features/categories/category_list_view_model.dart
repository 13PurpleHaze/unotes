import 'package:flutter/foundation.dart';

import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/categories/categories.dart';

class CategoryListViewModel extends ChangeNotifier {
  CategoryListViewModel({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository;

  final CategoryRepository _categoryRepository;
  List<NoteCategory> _categoryList = [];
  bool isFetching = false;
  bool isError = false;

  List<NoteCategory> get categoryList => _categoryList;

  void fetchCategoryList() async {
    try {
      isFetching = true;
      _categoryList = await _categoryRepository.getCategoryList();
      isError = false;
    } catch (e) {
      isError = true;
    } finally {
      isFetching = false;
      notifyListeners();
    }
  }

  void removeCategory(int categoryId) {
    _categoryRepository.removeCategory(categoryId);
    fetchCategoryList();
  }
}
