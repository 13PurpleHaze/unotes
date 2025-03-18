import 'package:flutter/material.dart';
import 'package:notesapp/app/widgets/animated_pressable.dart';
import 'package:notesapp/app/widgets/pressable_icon_button.dart';

enum CardMode {
  list,
  grid,
}

class NoteCard extends StatelessWidget {
  const NoteCard(
      {super.key,
      required String textTrim,
      required CardMode mode,
      required String date,
      required String categoryName,
      String? img,
      void Function(DismissDirection)? onDismissed,
      required int id,
      this.color})
      : _textTrim = textTrim,
        _mode = mode,
        _date = date,
        _categoryName = categoryName,
        _onDismissed = onDismissed,
        _img = img,
        _id = id;

  final String _textTrim;
  final Color? color;
  final CardMode _mode;
  final String _date;
  final String _categoryName;
  final int _id;
  final String? _img;
  final void Function(DismissDirection)? _onDismissed;

  @override
  Widget build(BuildContext context) {
    return _mode == CardMode.list
        ? Dismissible(
            key: ValueKey<int>(_id),
            background: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.delete),
                  Icon(Icons.delete, color: Theme.of(context).iconTheme.color),
                ],
              ),
            ),
            onDismissed: _onDismissed,
            child: AnimatedPressable(
              color: color ?? Theme.of(context).colorScheme.primary,
              onTap: () => {},
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _textTrim,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        _img != null
                            ? Image(
                                width: 50,
                                height: 50,
                                image: AssetImage('assets/$_img.png'),
                              )
                            : SizedBox()
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(_categoryName,
                            style: Theme.of(context).textTheme.labelSmall),
                        Text(
                          _date,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : AnimatedPressable(
            color: color ?? Theme.of(context).colorScheme.primary,
            onTap: () => {},
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        _textTrim,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          _date,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(_categoryName,
                            style: Theme.of(context).textTheme.labelSmall),
                      ),
                    ),
                  ],
                )),
          );
  }
}
