import 'package:flutter/material.dart';
import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/notes/notes.dart';

class NoteModel extends ChangeNotifier {
  NoteModel({required NoteRepository noteRepository, List<Note>? list})
      : _noteRepository = noteRepository,
        _list = list ?? [];

  List<Note> _list = [];
  final NoteRepository _noteRepository;

  get noteList => _list;

  Future<void> fetchNotes() async {
    final noteList = await _noteRepository.getNoteList();
    _list.addAll(noteList);
    notifyListeners();
  }

  Future<void> createNote(String content, int categoryId) async {
    _noteRepository.addNote(content, categoryId);
    await fetchNotes();
  }
}
