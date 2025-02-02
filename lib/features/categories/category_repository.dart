import 'package:notesapp/app/database/database.dart';

abstract interface class CategoryRepository {
  void addCategory(String title, int color);
  void removeCategory(int categoryId);
  Future<List<NoteCategory>> getCategoryList();
}
