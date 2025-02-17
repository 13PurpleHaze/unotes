import 'package:flutter/material.dart';
import 'package:notesapp/app/widgets/widgets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  // Leave out the height and width so it fills the animating parent.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const FlutterLogo(),
    );
  }
}

class TestAnim extends StatefulWidget {
  const TestAnim({super.key});

  @override
  State<TestAnim> createState() => _TestAnimState();
}

class _TestAnimState extends State<TestAnim>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<Offset> _animation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(microseconds: 200), vsync: this);
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(2, 2))
        .animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(milliseconds: 200), () {
            _controller.reverse();
          });
        }
      });

    _animation2 = Tween<Offset>(begin: Offset(2, 2), end: Offset(0, 0))
        .animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(milliseconds: 200), () {
            _controller.reverse();
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
              offset: _animation.value,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).iconTheme.color!, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).iconTheme.color!,
                        offset: _animation2.value)
                  ],
                ),
                child: child,
              ));
        },
        child: RippleContainer(
          onTap: () => {
            _controller.forward(),
          },
          child: Text('Я', style: Theme.of(context).textTheme.titleLarge),
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
