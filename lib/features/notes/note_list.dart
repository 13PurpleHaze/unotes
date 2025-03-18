import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/app/navigation/drawer.dart';
import 'package:notesapp/app/widgets/note_card.dart';
import 'package:notesapp/app/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';
import 'package:notesapp/features/create_category/create_category_dialog.dart';

import 'package:notesapp/features/notes/notes.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key, required this.viewModel});

  final NoteListViewModel viewModel;

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  CardMode listMode = CardMode.list;

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
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: PressableIconButton(
              icon: const Icon(
                Icons.list,
                color: Colors.black,
              ),
              onPressed: _onChangeListMode,
            ),
          ),
        ],
      ),
      body: _buildBody(context),
      floatingActionButton: PressableIconButton(
        icon: const Icon(
          Icons.add,
          size: 45,
        ),
        onPressed: () {
          context.go(
            '/notes/create',
            extra: _afterCreated, // 🤡
          );
        },
      ),
    );
  }

  void _afterCreated() {
    widget.viewModel.fetchNoteList();
  }

  Widget _buildBody(BuildContext context) {
    if (widget.viewModel.isFetching) {
      return Center(child: CircularProgressIndicator());
    }
    if (widget.viewModel.isError) return Text('Error');
    if (widget.viewModel.noteList.isNotEmpty) {
      return listMode == CardMode.list
          ? RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 100),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8,
                ),
                itemCount: widget.viewModel.noteList.length,
                itemBuilder: (context, index) {
                  final res =
                      jsonDecode(widget.viewModel.noteList[index].content);

                  NoteCategory? category = widget.viewModel.categoryList
                      .firstWhere(
                          (category) =>
                              category.id ==
                              widget.viewModel.noteList[index].category,
                          orElse: () => NoteCategory(
                              id: -1, title: 'Default', color: 4293487274));
                  String text = res[0]['insert'].toString().trim();
                  return NoteCard(
                    id: index,
                    textTrim:
                        text.length > 15 ? '${text.substring(0, 15)}...' : text,
                    mode: listMode,
                    date: Jiffy.parse(widget.viewModel.noteList[index].createdAt
                            .toString())
                        .toNow(),
                    color: Color(category.color),
                    categoryName: 'Category: ${category.title}',
                    onDismissed: (DismissDirection direction) =>
                        _onRemove(widget.viewModel.noteList[index].id),
                  );
                },
              ),
            )
          : RefreshIndicator(
              onRefresh: _onRefresh,
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 100, left: 8, right: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: widget.viewModel.noteList.length,
                itemBuilder: (context, index) {
                  final res =
                      jsonDecode(widget.viewModel.noteList[index].content);
                  NoteCategory category = widget.viewModel.categoryList
                      .firstWhere((category) =>
                          category.id ==
                          widget.viewModel.noteList[index].category);
                  String text = res[0]['insert'].toString().trim();
                  return NoteCard(
                    textTrim: text.length > 15 ? text.substring(0, 15) : text,
                    mode: listMode,
                    date: Jiffy.parse(widget.viewModel.noteList[index].createdAt
                            .toString())
                        .toNow(),
                    color: Color(category.color),
                    categoryName: 'Category: ${category.title}',
                    id: widget.viewModel.noteList[index].id,
                  );
                },
              ),
            );
    } else {
      return Column(children: [
        Center(
          child: Text(
            'There is nothing yet :((((',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
      ]);
    }
  }

  void _onChangeListMode() {
    setState(() {
      listMode = listMode == CardMode.list ? CardMode.grid : CardMode.list;
    });
  }

  Future<void> _onRefresh() async => widget.viewModel.fetchNoteList();

  void _onRemove(int noteId) {
    widget.viewModel.removeNote(noteId);
    setState(() {});
  }
}
