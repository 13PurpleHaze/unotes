import 'package:flutter/material.dart';

import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/categories/category_repository.dart';
import 'package:notesapp/features/notes/notes.dart';

class NoteListViewModel extends ChangeNotifier {
  final NoteRepository _noteRepository;
  final CategoryRepository _categoryRepository;
  final Set<Note> _noteList = {};
  final Set<NoteCategory> _categoryList = {};

  bool isFetching = false;
  bool isError = false;

  NoteListViewModel(
      {required NoteRepository noteRepository,
      required CategoryRepository categoryRepository})
      : _noteRepository = noteRepository,
        _categoryRepository = categoryRepository;

  List<Note> get noteList => _noteList.toList().reversed.toList();
  List<NoteCategory> get categoryList => _categoryList.toList();

  void fetchNoteList() async {
    try {
      isFetching = true;
      final noteList = await _noteRepository.getNoteList();
      _noteList.addAll(noteList);
      await _fetchCategoryList();
      isFetching = false;
    } catch (e) {
      isError = true;
      isFetching = false;
    } finally {
      notifyListeners();
    }
  }

  Future<void> _fetchCategoryList() async {
    final categoryList = await _categoryRepository.getCategoryList();
    _categoryList.addAll(categoryList);
  }

  Future<void> removeNote(int noteId) async {
    await _noteRepository.removeNote(noteId);
    fetchNoteList();
    notifyListeners();
  }
}
