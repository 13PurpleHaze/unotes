import 'package:flutter/foundation.dart';
import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/categories/category_repository.dart';

class CategoryListViewModel extends ChangeNotifier {
  final CategoryRepository _categoryRepository;
  final Set<NoteCategory> _categoryList = {};

  CategoryListViewModel({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository;

  List<NoteCategory> get categoryList => _categoryList.toList();

  void fetchCategoryList() async {
    final categoryList = await _categoryRepository.getCategoryList();
    _categoryList.addAll(categoryList);
    notifyListeners();
  }
}
