import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  const CategoryCard({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Row(
          children: [
            Icon(
              Icons.note,
              color: color,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(title, style: Theme.of(context).textTheme.titleSmall)
          ],
        ));
  }
}
