import 'package:flutter/material.dart';
import 'package:notesapp/app/widgets/widgets.dart';

enum ButtonVariant { primary, secondary, tertiary }

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final ButtonVariant variant;

  const PrimaryButton(
      {super.key,
      required this.onPressed,
      required this.child,
      required this.variant});

  @override
  Widget build(BuildContext context) {
    return RippleContainer(
      color: _getButtonColor(context),
      onTap: onPressed,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: child,
          )),
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
