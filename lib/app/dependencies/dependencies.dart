import 'package:flutter/material.dart';
import 'package:notesapp/app/theme/brightness_view_model.dart';
import 'package:notesapp/features/notes/note-model.dart';
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
  Provider<CategoryRepository>(
    create: (context) =>
        LocalCategoryRepository(localStore: context.read<AppDatabase>()),
  ),
  ChangeNotifierProvider(
    create: (context) => NoteListViewModel(
        noteRepository: context.read<NoteRepository>(),
        categoryRepository: context.read<CategoryRepository>()),
  ),
  ChangeNotifierProvider<CreateNoteViewModel>(
      create: (context) => CreateNoteViewModel(
          noteRepository: context.read<NoteRepository>(),
          categoryRepository: context.read<CategoryRepository>())),
  ChangeNotifierProvider<CategoryListViewModel>(
      create: (context) => CategoryListViewModel(
          categoryRepository: context.read<CategoryRepository>())),
  ChangeNotifierProvider<CreateCategoryViewModel>(
    create: (context) => CreateCategoryViewModel(
        categoryRepository: context.read<CategoryRepository>()),
  ),
  ChangeNotifierProvider<BrightnessViewModel>(
    create: (context) => BrightnessViewModel(),
  ),
];
