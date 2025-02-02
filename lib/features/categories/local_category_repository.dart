import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/categories/categories.dart';

class LocalCategoryRepository implements CategoryRepository {
  final AppDatabase localStore;

  LocalCategoryRepository({required this.localStore});

  @override
  void addCategory(String title, int color) async {
    await localStore
        .into(localStore.noteCategories)
        .insert(NoteCategoriesCompanion.insert(title: title, color: color));
  }

  @override
  void removeCategory(int categoryId) async {
    await (localStore.delete(localStore.noteCategories)
          ..where((noteCategory) => noteCategory.id.equals(categoryId)))
        .go();
  }

  @override
  Future<List<NoteCategory>> getCategoryList() async {
    return await localStore.select(localStore.noteCategories).get();
  }
}
