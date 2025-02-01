import 'package:flutter/material.dart';
import 'package:notesapp/features/categories/widgets/color_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:notesapp/features/create_category/create_category_view_model.dart';
import 'package:provider/provider.dart';

class CreateCategoryDialog extends StatefulWidget {
  const CreateCategoryDialog({
    super.key,
  });

  @override
  State<CreateCategoryDialog> createState() => _CreateCategoryDialogState();
}

class _CreateCategoryDialogState extends State<CreateCategoryDialog> {
  Color? _selectedColor;
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SimpleDialogOption(
          child: TextField(
              onChanged: (value) {
                _text = value;
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Category\'s name',
                suffixIcon: IconButton(
                    onPressed: () async {
                      int? color = await showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const ColorPicker());
                      if (color != null) {
                        _selectedColor = Color(color);
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.square)),
                suffixIconColor: _selectedColor,
              )),
        ),
        SimpleDialogOption(
            child: Consumer<CreateCategoryViewModel>(
                builder: (context, viewModel, child) => FilledButton(
                    onPressed: () {
                      if (_text != '') {
                        viewModel.createNote(
                            _text,
                            _selectedColor?.value ??
                                Theme.of(context).primaryColor.value);
                      }
                      context.pop(true);
                    },
                    child: const Text('Create'))))
      ],
    );
  }
}
