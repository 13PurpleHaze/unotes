import 'package:flutter/material.dart';
import 'package:notesapp/features/createNote/create_note_view_model.dart';
import 'package:go_router/go_router.dart';

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
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        FilledButton(
            onPressed: () {
              createNote(context);
            },
            child: const Text('Создать'))
      ])),
    );
  }
}
