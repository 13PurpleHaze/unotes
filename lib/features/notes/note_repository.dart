import 'package:flutter/material.dart';
import 'package:notesapp/app/database/database.dart';

abstract interface class NoteRepository extends ChangeNotifier {
  void addNote(String content);
  Future<List<Note>> getNoteList();
}
