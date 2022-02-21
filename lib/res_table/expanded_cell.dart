import 'package:flutter/material.dart';

class ExpandedCell extends StatelessWidget {
  const ExpandedCell({Key? key, required this.title, required this.children})
      : super(key: key);

  final List<Widget> children;
  final List<Widget> title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (6 * 200) + (10 * 2 * 6),
      child: ExpansionTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          children: title,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
