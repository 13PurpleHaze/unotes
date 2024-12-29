import 'dart:math';

import 'package:flutter/material.dart';

class PaintNote extends StatefulWidget {
  const PaintNote({super.key});

  @override
  State<PaintNote> createState() => _PaintNoteState();
}

class _PaintNoteState extends State<PaintNote> {
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onPanEnd: (details) {
        points.add(null);
        setState(() {});
      },
      onPanUpdate: (details) {
        points.add(details.localPosition);
        setState(() {});
      },
      child: CustomPaint(
        painter: MyPainter(points: points),
        size: Size.infinite,
      ),
    ));
  }
}

class MyPainter extends CustomPainter {
  final List<Offset?> points;

  MyPainter({required this.points});

  // метод для перерисовки виджета
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 4;

    for (var i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  void _drawLine() {}

  // когда надо вызывать paint для перерисовки
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
