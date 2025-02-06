import 'package:flutter/material.dart';

const double containerRadius = 16;
// TODO: подумать что сделать со стандартными значениями

class RippleContainer extends Container {
  double? width;
  double? height;
  double borderRadius;
  void Function()? onTap;

  RippleContainer(
      {super.key,
      this.onTap,
      this.borderRadius = containerRadius,
      required Widget super.child,
      super.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).iconTheme.color!, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).iconTheme.color!,
                  offset: const Offset(2, 2))
            ]),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius - 2)),
          color: color ?? Theme.of(context).colorScheme.onPrimary,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            onTap: onTap,
            child: child,
          ),
        ));
  }
}
