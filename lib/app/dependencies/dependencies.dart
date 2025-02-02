import 'package:provider/provider.dart';

import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/categories/categories.dart';
import 'package:notesapp/features/create_category/create_category.dart';
import 'package:notesapp/features/create_note/create_note.dart';
import 'package:notesapp/features/notes/notes.dart';

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
  ChangeNotifierProvider<CreateNoteViewModel>(
      create: (context) =>
          CreateNoteViewModel(noteRepository: context.read<NoteRepository>())),
  Provider<CategoryRepository>(
    create: (context) =>
        LocalCategoryRepository(localStore: context.read<AppDatabase>()),
  ),
  ChangeNotifierProvider<CategoryListViewModel>(
      create: (context) => CategoryListViewModel(
          categoryRepository: context.read<CategoryRepository>())),
  ChangeNotifierProvider<CreateCategoryViewModel>(
    create: (context) => CreateCategoryViewModel(
        categoryRepository: context.read<CategoryRepository>()),
  )
];
