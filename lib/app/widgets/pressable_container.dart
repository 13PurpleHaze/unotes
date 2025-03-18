import 'package:flutter/material.dart';

const double containerRadius = 16;

class PressableContainer extends StatelessWidget {
  const PressableContainer(
      {super.key,
      required this.child,
      required this.offset,
      required this.borderRadius,
      this.onTap,
      this.color,
      this.width,
      this.height});

  final Widget? child;
  final Offset offset;
  final Function()? onTap;
  final double borderRadius;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).iconTheme.color!, width: 2),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        boxShadow: [
          BoxShadow(color: Theme.of(context).iconTheme.color!, offset: offset)
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius - 2)),
        color: color ?? Color(4288059030),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
