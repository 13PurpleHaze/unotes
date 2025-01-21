import 'package:flutter/material.dart';
import 'package:notesapp/app/navigation/tab_item.dart';

const double bottomNavBarHeight = 70;

class BottomNavBar extends StatefulWidget {
  var activeIndex = 0;
  final List<TabItem> tabs;
  final ValueChanged<int> onTabChange;

  BottomNavBar({
    super.key,
    this.activeIndex = 0,
    required this.tabs,
    required this.onTabChange,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bottomNavBarHeight,
      child: Row(
        children: _generateTabs(),
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }

  _generateTabs() {
    return widget.tabs
        .asMap()
        .map((index, tab) {
          return MapEntry(
              index,
              Flexible(
                  fit: FlexFit.tight,
                  child: Material(
                      color:
                          Theme.of(context).navigationBarTheme.backgroundColor,
                      borderRadius: _getBorderRadiusForTab(index),
                      child: InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: _getBorderRadiusForTab(index),
                          ),
                          onTap: () => widget.onTabChange(index),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  tab.icon.icon,
                                  color: index == widget.activeIndex
                                      ? Colors.amber
                                      : Colors.white,
                                ),
                                Text(
                                  tab.text,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: index == widget.activeIndex
                                              ? Colors.amber
                                              : Colors.white),
                                )
                              ])))));
        })
        .values
        .toList();
  }

  BorderRadius _getBorderRadiusForTab(index) {
    return BorderRadius.only(
      topLeft: index == 0 ? const Radius.circular(24) : Radius.zero,
      bottomLeft: index == 0 ? const Radius.circular(24) : Radius.zero,
      topRight: index == widget.tabs.length - 1
          ? const Radius.circular(24)
          : Radius.zero,
      bottomRight: index == widget.tabs.length - 1
          ? const Radius.circular(24)
          : Radius.zero,
    );
  }
}
