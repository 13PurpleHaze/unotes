import 'package:flutter/material.dart';
import 'package:notesapp/app/widgets/pressable_container.dart';

const int animationDurationTime = 80;
const double containerRadius = 16;

class AnimatedPressable extends StatefulWidget {
  const AnimatedPressable(
      {super.key,
      required this.child,
      this.onTap,
      this.borderRadius = containerRadius,
      this.color,
      this.width,
      this.height});

  final Widget child;
  final void Function()? onTap;
  final double borderRadius;
  final Color? color;
  final double? width;
  final double? height;

  @override
  State<AnimatedPressable> createState() => _PressableState();
}

class _PressableState extends State<AnimatedPressable>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: animationDurationTime),
      vsync: this,
    );
    _animation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(2, 2))
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                Future.delayed(
                  const Duration(milliseconds: animationDurationTime),
                  () {
                    _controller.reverse();
                  },
                );
              }
            },
          );
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: _animation.value,
            child: PressableContainer(
              onTap: _doAnimation,
              offset: const Offset(2, 2) - _animation.value,
              borderRadius: widget.borderRadius,
              color: widget.color,
              width: widget.width,
              height: widget.height,
              child: child,
            ),
          );
        },
        child: widget.child,
      );

  void _doAnimation() {
    if (widget.onTap != null) {
      _controller.forward();
      widget.onTap!();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
