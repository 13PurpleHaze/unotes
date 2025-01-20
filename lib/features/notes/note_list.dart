import 'package:flutter/material.dart';
import 'package:notesapp/features/notes/note_list_view_model.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key, required this.viewModel});

  final NoteListViewModel viewModel;

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchNoteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.viewModel.noteList.length,
        itemBuilder: (context, index) =>
            Text(widget.viewModel.noteList[index].content),
      ),
    );
  }
}
