import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/categories/category_color.dart';
import 'package:notesapp/features/categories/category_repository.dart';

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
  Future<List<NoteCategory>> getCategoryList() async {
    return await localStore.select(localStore.noteCategories).get();
  }
}
