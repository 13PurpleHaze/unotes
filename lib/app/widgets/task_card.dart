import 'package:flutter/material.dart';
import 'package:notesapp/app/widgets/widgets.dart';

class TaskCard extends StatelessWidget {
  final Function() onCheck;
  final String text;
  final bool done;

  const TaskCard(
      {super.key,
      required this.onCheck,
      required this.text,
      required this.done});

  @override
  Widget build(BuildContext context) {
    return RippleContainer(
        onTap: onCheck,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(children: [
              Checkbox(
                  value: done,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    onCheck();
                  }),
              Flexible(
                  child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              )),
            ])));
  }
}
