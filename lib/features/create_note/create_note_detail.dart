import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/app/widgets/pressable_icon_button.dart';

import 'package:notesapp/features/create_note/create_note.dart';
import 'package:notesapp/features/create_note/widgets/widgets.dart';

class CreateNoteDetail extends StatefulWidget {
  const CreateNoteDetail(
      {super.key,
      required this.viewModel,
      required this.afterCreated,
      this.noteId});

  final CreateNoteViewModel viewModel;
  final Function afterCreated;
  final int? noteId;

  @override
  State<CreateNoteDetail> createState() => _CreateNoteDetailState();
}

class _CreateNoteDetailState extends State<CreateNoteDetail> {
  final QuillController _controller = QuillController.basic();
  final List<NoteCategory> _categories = [];
  NoteCategory? selectedCategory;

  @override
  void initState() {
    if (widget.noteId != null) {
      widget.viewModel.fetchNoteById(widget.noteId!);
    }
    widget.viewModel.fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (res, data) {
        _save();
        widget.afterCreated();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create note',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PressableIconButton(
                icon: const Icon(
                  Icons.done,
                  color: Colors.black,
                ),
                onPressed: _onSave,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            SafeArea(
              child: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: QuillEditor.basic(
                          controller: _controller,
                          config: QuillEditorConfig(
                            embedBuilders: FlutterQuillEmbeds.editorBuilders(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // TODO: ошибки и мб добавить лоадер на весь экран пока категорий не загрузятся
            widget.viewModel.isFetching
                ? SizedBox()
                : Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: BottomActionsBar(
                      categories: widget.viewModel.categories,
                      controller: _controller,
                      onSelectCategory: _onSelectCategory,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void _onSelectCategory(NoteCategory category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void _onSave() {
    context.go('/notes');
  }

  void _save() {
    final String json = jsonEncode(_controller.document.toDelta().toJson());
    widget.viewModel.createNote(
      json,
      selectedCategory,
    );
  }
}
