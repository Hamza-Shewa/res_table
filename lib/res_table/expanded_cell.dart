import 'package:flutter/material.dart';

class ExpandedCell extends StatelessWidget {
  const ExpandedCell({
    Key? key,
    required this.title,
    required this.children,
    this.childPadding = const EdgeInsets.all(8.0),
    this.tileControlAffinity = ListTileControlAffinity.leading,
  }) : super(key: key);

  final List<Widget> children;
  final List<Widget> title;
  final EdgeInsets childPadding;
  final ListTileControlAffinity tileControlAffinity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (title.length * 200) +
          (((childPadding.horizontal / 2) + 2) * 2 * title.length.toDouble()),
      child: ExpansionTile(
        controlAffinity: tileControlAffinity,
        title: Row(
          children: title,
        ),
        children: [
          Padding(
            padding: childPadding,
            child: Row(
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
