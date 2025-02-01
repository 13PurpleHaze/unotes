import 'package:flutter/material.dart';
import 'package:notesapp/features/notes/note_repository.dart';

class CreateNoteViewModel extends ChangeNotifier {
  final NoteRepository noteRepository;

  CreateNoteViewModel({required this.noteRepository});

  void createNote(String content) {
    try {
      noteRepository.addNote(content);
    } catch (e) {
      print(e.toString());
    }
  }
}
