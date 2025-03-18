import 'package:drift/drift.dart';
import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/notes/notes.dart';

class LocalNoteRepository implements NoteRepository {
  final AppDatabase localStore;

  LocalNoteRepository({required this.localStore});

  @override
  void addNote(String content, int? categoryId) async {
    await localStore.into(localStore.notes).insert(NotesCompanion.insert(
        content: content,
        category: Value(categoryId),
        createdAt: DateTime.now()));
  }

  @override
  Future<List<Note>> getNoteList() async {
    return await localStore.select(localStore.notes).get();
  }

  @override
  Future<void> removeNote(int noteId) async {
    await (localStore.delete(localStore.notes)
          ..where((note) => note.id.equals(noteId)))
        .go();
  }
  
  @override
  Future<Note> getNoteById(int noteId) {
      return (localStore.select(localStore.notes)..where((note) => note.id.equals(noteId))).get();
  }
}
