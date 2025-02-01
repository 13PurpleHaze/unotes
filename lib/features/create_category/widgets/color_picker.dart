import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const List<int> colors = [
  4294950656,
  4279863809,
  4279580810,
  4286456970,
  4289335055,
  4279216810,
  4288059030
];

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      children: [
        SimpleDialogOption(
          child: Wrap(
              children: colors
                  .map((color) => IconButton(
                      onPressed: () => {context.pop(color)},
                      color: Color(color),
                      icon: const Icon(Icons.square)))
                  .toList()),
        )
      ],
    );
  }
}
