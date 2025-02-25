import 'package:flutter/material.dart';
import 'package:notesapp/app/navigation/drawer.dart';
import 'package:notesapp/app/widgets/widgets.dart';

import 'package:notesapp/features/notes/notes.dart';

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
        appBar: AppBar(
          title: Text(
            'Notes',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PressableIconButton(
                icon: const Icon(
                  Icons.save,
                  color: Colors.black,
                ),
                onPressed: () => {},
              ),
            ),
          ],
        ),
        drawer: NavDrawer(),
        body: widget.viewModel.noteList.isNotEmpty
            ? ListView.builder(
                itemCount: widget.viewModel.noteList.length,
                itemBuilder: (context, index) =>
                    Text(widget.viewModel.noteList[index].content),
              )
            : Column(children: [
                Center(
                  child: Text(
                    'There is nothing yet :((((',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ]),
        floatingActionButton: PressableIconButton(
          icon: const Icon(
            Icons.add,
            size: 45,
          ),
          onPressed: () {},
        ));
  }
}
