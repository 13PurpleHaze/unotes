import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.content, required this.color});

  final String content;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.all(30),
      child: Text(content),
    );
  }
}
