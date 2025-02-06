import 'package:flutter/material.dart';
import 'package:notesapp/app/widgets/widgets.dart';

const defaultPadding = 2.0;

class BorderedIconButton extends StatelessWidget {
  final Icon icon;
  const BorderedIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return RippleContainer(
        onTap: () => {},
        borderRadius: 100,
        color: Theme.of(context).colorScheme.tertiary,
        child: Padding(
            padding: const EdgeInsets.all(defaultPadding), child: icon));
  }
}
