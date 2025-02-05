import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const List<int> colors = [
  4293433413,
  4285515962,
  4285094617,
  4293487274,
  4294103164,
  4281512324,
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
                      icon: const Icon(Icons.circle)))
                  .toList()),
        )
      ],
    );
  }
}
