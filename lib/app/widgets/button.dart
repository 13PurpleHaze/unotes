import 'package:flutter/material.dart';
import 'package:notesapp/app/widgets/animated_pressable.dart';

enum ButtonVariant { primary, secondary, tertiary }

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.child,
      required this.onPressed,
      this.variant = ButtonVariant.primary});

  final Widget child;
  final void Function() onPressed;
  final ButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return AnimatedPressable(
      onTap: onPressed,
      color: _getButtonColor(context),
      child: Padding(
        padding: const EdgeInsets.all(8), // TODO: вынести
        child: Center(
          child: child,
        ),
      ),
    );
  }

  Color? _getButtonColor(BuildContext context) {
    switch (variant) {
      case ButtonVariant.primary:
        return Theme.of(context).colorScheme.primary;
      case ButtonVariant.secondary:
        return Theme.of(context).colorScheme.secondary;
      case ButtonVariant.tertiary:
        return Theme.of(context).colorScheme.tertiary;
    }
  }
}
