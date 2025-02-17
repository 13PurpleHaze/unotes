import 'package:flutter/material.dart';

const double containerRadius = 16;
// TODO: подумать что сделать со стандартными значениями

class RippleContainer extends StatelessWidget {
  double? width;
  double? height;
  double borderRadius;
  void Function()? onTap;
  Offset? offset;
  final Widget child;
  Color? color;

  RippleContainer(
      {super.key,
      this.onTap,
      this.borderRadius = containerRadius,
      required this.child,
      this.color});

  @override
  Widget build(BuildContext context) {
    print(offset);
    return Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          // border:
          //     Border.all(color: Theme.of(context).iconTheme.color!, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
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
