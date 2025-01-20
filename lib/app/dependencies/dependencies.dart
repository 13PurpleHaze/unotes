import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/notes/local_note_repository.dart';
import 'package:notesapp/features/notes/note_repository.dart';
import 'package:provider/provider.dart';

final dependencies = [
  Provider<AppDatabase>(create: (context) => AppDatabase()),
  ChangeNotifierProvider<NoteRepository>(
      create: (context) => LocalNoteRepository(localStore: context.read()))
];
