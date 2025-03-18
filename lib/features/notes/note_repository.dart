import 'package:notesapp/app/database/database.dart';

abstract interface class NoteRepository {
  void addNote(String content, int? categoryId);
  Future<void> removeNote(int noteId);
  Future<Note> getNoteById(int noteId);
  Future<List<Note>> getNoteList();
}
