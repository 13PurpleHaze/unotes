import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/categories/category_color.dart';

abstract interface class CategoryRepository {
  void addCategory(String title, int color);
  Future<List<NoteCategory>> getCategoryList();
}
