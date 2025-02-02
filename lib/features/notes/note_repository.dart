import 'package:notesapp/app/database/database.dart';

abstract interface class NoteRepository {
  void addNote(String content);
  Future<List<Note>> getNoteList();
}
