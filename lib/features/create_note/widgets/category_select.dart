import 'package:flutter/material.dart';
import 'package:notesapp/app/database/database.dart';

class CategorySelect extends StatefulWidget {
  const CategorySelect(
      {super.key, required this.categories, required this.onSelectCategory});

  final List<NoteCategory> categories;
  final void Function(NoteCategory) onSelectCategory;

  @override
  State<CategorySelect> createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  NoteCategory? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<NoteCategory>(
      value: dropdownValue ??
          NoteCategory(id: -1, title: 'Select category', color: 4281512324),
      icon: const Icon(Icons.arrow_upward),
      elevation: 1,
      borderRadius: BorderRadius.all(Radius.circular(16)),
      style: const TextStyle(color: Colors.deepPurple),
      underline:
          Container(height: 2, color: Theme.of(context).colorScheme.primary),
      onChanged: (NoteCategory? value) {
        widget.onSelectCategory(value!);
        setState(() {
          dropdownValue = value!;
        });
      },
      items: [
        NoteCategory(id: -1, title: 'Select category', color: 4281512324),
        ...widget.categories,
      ].map<DropdownMenuItem<NoteCategory>>((NoteCategory category) {
        return DropdownMenuItem<NoteCategory>(
            value: category,
            child: Text(
              category.title,
              style: TextStyle(color: Color(category.color)),
            ));
      }).toList(),
    );
  }
}
