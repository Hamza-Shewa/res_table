import 'package:flutter/material.dart';

class ExpandedCell extends StatelessWidget {
  ExpandedCell({
    Key? key,
    required this.title,
    required this.children,
    this.tileControlAffinity = ListTileControlAffinity.leading,
  }) : super(key: key);

  final List<Widget> children;
  final List<Widget> title;
  final ListTileControlAffinity tileControlAffinity;
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (title.length * 200) + (20 * title.length.toDouble()),
      child: ExpansionTile(
        expandedAlignment: Alignment.centerLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        controlAffinity: tileControlAffinity,
        title: Row(
          children: title,
        ),
        children: [
          Scrollbar(
            controller: controller,
            scrollbarOrientation: ScrollbarOrientation.bottom,
            isAlwaysShown: true,
            child: SingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: children,
              ),
            ),
          )
        ],
      ),
    );
  }
}
