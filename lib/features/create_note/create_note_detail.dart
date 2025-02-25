import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:notesapp/features/create_note/create_note.dart';

class CreateNoteDetail extends StatelessWidget {
  final CreateNoteViewModel viewModel;
  const CreateNoteDetail({super.key, required this.viewModel});

  void createNote(BuildContext context) {
    viewModel.createNote('Создал');
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Placeholder(),
      ),
    );
  }
}
