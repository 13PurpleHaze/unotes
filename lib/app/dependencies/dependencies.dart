import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/categories/category_list_view_model.dart';
import 'package:notesapp/features/categories/category_repository.dart';
import 'package:notesapp/features/categories/local_category_repository.dart';
import 'package:notesapp/features/createNote/create_note_view_model.dart';
import 'package:notesapp/features/create_category/create_category_view_model.dart';
import 'package:notesapp/features/notes/local_note_repository.dart';
import 'package:notesapp/features/notes/note_list_view_model.dart';
import 'package:notesapp/features/notes/note_repository.dart';
import 'package:provider/provider.dart';

final dependencies = [
  Provider<AppDatabase>(
    create: (context) => AppDatabase(),
    dispose: (context, db) => db.close(),
  ),
  Provider<NoteRepository>(
      create: (context) =>
          LocalNoteRepository(localStore: context.read<AppDatabase>())),
  ChangeNotifierProvider(
    create: (context) =>
        NoteListViewModel(noteRepository: context.read<NoteRepository>()),
  ),
  ChangeNotifierProvider(
      create: (context) =>
          CreateNoteViewModel(noteRepository: context.read<NoteRepository>())),
  Provider<CategoryRepository>(
    create: (context) =>
        LocalCategoryRepository(localStore: context.read<AppDatabase>()),
  ),
  ChangeNotifierProvider(
      create: (context) => CategoryListViewModel(
          categoryRepository: context.read<CategoryRepository>())),
  ChangeNotifierProvider<CreateCategoryViewModel>(
    create: (context) => CreateCategoryViewModel(
        categoryRepository: context.read<CategoryRepository>()),
  )
];
