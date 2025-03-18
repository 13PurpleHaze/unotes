import 'package:notesapp/app/database/database.dart';

abstract interface class CategoryRepository {
  void addCategory(String title, int color);
  void removeCategory(int categoryId);
  void updateCategory(int categoryId, String? title, int? color);
  Future<List<NoteCategory>> getCategoryList();
}
