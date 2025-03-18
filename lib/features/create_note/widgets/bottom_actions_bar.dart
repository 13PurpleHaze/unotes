import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:notesapp/app/database/database.dart';
import 'package:notesapp/features/create_note/widgets/category_select.dart';

final config = [];

class BottomActionsBar extends StatelessWidget {
  const BottomActionsBar(
      {super.key,
      required this.onSelectCategory,
      required QuillController controller,
      required List<NoteCategory> categories})
      : _controller = controller,
        _categories = categories;

  final QuillController _controller;
  final List<NoteCategory> _categories;
  final void Function(NoteCategory) onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [BoxShadow(offset: Offset(0, -2), color: Colors.black)]),
      child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: QuillSimpleToolbar(
            controller: _controller,
            config: QuillSimpleToolbarConfig(
              showAlignmentButtons: false,
              showFontFamily: false,
              showFontSize: false,
              showCenterAlignment: false,
              showCodeBlock: false,
              showDirection: false,
              showColorButton: false,
              showIndent: false,
              showJustifyAlignment: false,
              showLeftAlignment: false,
              showLink: false,
              showQuote: false,
              showHeaderStyle: false,
              showInlineCode: false,
              showRightAlignment: false,
              showBackgroundColorButton: false,
              showSubscript: false,
              showSuperscript: false,
              showClearFormat: false,
              embedButtons: [
                ...FlutterQuillEmbeds.toolbarButtons(videoButtonOptions: null),
                if (_categories.isNotEmpty)
                  (context, embedContext) => CategorySelect(
                        categories: _categories,
                        onSelectCategory: onSelectCategory,
                      )
                else
                  (context, embedContext) => Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
