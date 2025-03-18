import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notesapp/app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'package:notesapp/features/create_category/create_category.dart';
import 'package:notesapp/features/create_category/widgets/widgets.dart';

class CreateCategoryDialog extends StatefulWidget {
  const CreateCategoryDialog(
      {super.key, this.categoryId, this.categoryTitle, this.categoryColor});

  final int? categoryId;
  final String? categoryTitle;
  final Color? categoryColor;

  @override
  State<CreateCategoryDialog> createState() => _CreateCategoryDialogState();
}

class _CreateCategoryDialogState extends State<CreateCategoryDialog> {
  Color? _selectedColor;
  String _text = '';
  final TextEditingController _controller = TextEditingController(text: '');

  @override
  void initState() {
    if (widget.categoryTitle != null) {
      _controller.text = widget.categoryTitle!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SimpleDialogOption(
          child: TextField(
              onChanged: (value) {
                setState(() {
                  _text = value;
                });
              },
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Category\'s name',
                suffixIcon: IconButton(
                    onPressed: () => _showDialog(context),
                    icon: const Icon(Icons.circle)),
                suffixIconColor: _selectedColor ??
                    widget.categoryColor ??
                    Theme.of(context).primaryColor,
              )),
        ),
        SimpleDialogOption(
          child: Consumer<CreateCategoryViewModel>(
            builder: (context, viewModel, child) => Button(
              onPressed: () => _onPressed(viewModel),
              child: Text(
                widget.categoryId != null ? 'Save' : 'Create',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    int? color = await showDialog(
        context: context,
        builder: (BuildContext context) => const ColorPicker());
    if (color != null) {
      setState(() {
        _selectedColor = Color(color);
      });
    }
  }

  void _onPressed(CreateCategoryViewModel viewModel) {
    if (widget.categoryId == null) {
      if (_text != '') {
        viewModel.createCategory(_text,
            _selectedColor?.value ?? Theme.of(context).primaryColor.value);
      }
      context.pop(true);
    } else {
      if (_text != '' || _selectedColor != null) {
        viewModel.updateCategory(widget.categoryId!,
            _text != '' ? _text : widget.categoryTitle, _selectedColor?.value);
      }
      context.pop(true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
