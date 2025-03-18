import 'package:flutter/material.dart';
import 'package:notesapp/app/widgets/animated_pressable.dart';

const double defaultPadding = 8;
const double defaultBorderRadius = 100;

class PressableIconButton extends StatelessWidget {
  const PressableIconButton({super.key, required this.icon, this.onPressed});

  final Icon icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedPressable(
        onTap: onPressed,
        borderRadius: defaultBorderRadius,
        color: Theme.of(context).colorScheme.tertiary,
        child: Padding(
            padding: const EdgeInsets.all(defaultPadding), child: icon));
  }
}
