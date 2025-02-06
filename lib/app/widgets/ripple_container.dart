import 'package:flutter/material.dart';

const double containerRadius = 16;
// TODO: подумать что сделать со стандартными значениями

class RippleContainer extends Container {
  double? width;
  double? height;
  void Function()? onTap;

  RippleContainer(
      {super.key,
      this.height,
      this.width,
      this.onTap,
      required Widget super.child,
      super.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).iconTheme.color!, width: 2),
            borderRadius:
                const BorderRadius.all(Radius.circular(containerRadius)),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).iconTheme.color!,
                  offset: const Offset(3, 3))
            ]),
        child: Material(
          borderRadius:
              const BorderRadius.all(Radius.circular(containerRadius - 2)),
          color: color ?? Theme.of(context).colorScheme.onPrimary,
          child: InkWell(
            borderRadius:
                const BorderRadius.all(Radius.circular(containerRadius)),
            onTap: onTap,
            child: child,
          ),
        ));
  }
}
