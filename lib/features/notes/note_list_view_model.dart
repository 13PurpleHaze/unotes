import 'package:flutter/material.dart';

import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/notes/notes.dart';

class NoteListViewModel extends ChangeNotifier {
  final NoteRepository _noteRepository;
  final Set<Note> _noteList = {};

  NoteListViewModel({required NoteRepository noteRepository})
      : _noteRepository = noteRepository;

  List<Note> get noteList => _noteList.toList();

  void fetchNoteList() async {
    final noteList = await _noteRepository.getNoteList();
    _noteList.addAll(noteList);
    notifyListeners();
  }
}
