import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/notes/note_repository.dart';

class LocalNoteRepository implements NoteRepository {
  final AppDatabase localStore;

  LocalNoteRepository({required this.localStore});

  @override
  void addNote(String content) async {
    await localStore
        .into(localStore.notes)
        .insert(NotesCompanion.insert(content: content));
  }

  @override
  Future<List<Note>> getNoteList() async {
    return await localStore.select(localStore.notes).get();
  }
}
