import 'package:flutter/material.dart';
import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/categories/category_repository.dart';
import 'package:notesapp/features/notes/note_repository.dart';

class CreateNoteViewModel extends ChangeNotifier {
  CreateNoteViewModel(
      {required NoteRepository noteRepository,
      required CategoryRepository categoryRepository})
      : _noteRepository = noteRepository,
        _categoryRepository = categoryRepository;

  final NoteRepository _noteRepository;
  final CategoryRepository _categoryRepository;
  List<NoteCategory> categories = [];
  bool isFetching = false;
  bool isError = false;

  void createNote(String content, NoteCategory? category) {
    _noteRepository.addNote(content, category?.id == -1 ? null : category?.id);
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    try {
      isFetching = true;
      categories = await _categoryRepository.getCategoryList();
    } catch (e) {
      isError = true;
    } finally {
      isFetching = false;
      notifyListeners();
    }
  }

  Future<void> delete(int noteId) async {
    // TODO
  }

  Future<void> fetchNoteById(int noteId) async {
    // TODO: isFetching и isError разделить на два запроса
    try {
      isFetching = true;
      categories = await _noteRepository.();
    } catch (e) {
      isError = true;
    } finally {
      isFetching = false;
      notifyListeners();
    }
  }
}
