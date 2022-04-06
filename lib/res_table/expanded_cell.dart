import 'package:flutter/material.dart';

class ExpandedCell extends StatelessWidget {
  ExpandedCell({
    Key? key,
    required this.title,
    required this.children,
    this.verticalMargin = 0,
    this.decoration = const BoxDecoration(),
    this.tileControlAffinity = ListTileControlAffinity.trailing,
  }) : super(key: key);

  final List<Widget> children;
  final List title;
  final ListTileControlAffinity tileControlAffinity;
  final ScrollController controller = ScrollController();
  final BoxDecoration decoration;
  final double verticalMargin;

  @override
  Widget build(BuildContext context) {
    double _width = 0;
    for (var i in title) {
      _width += i.size.width;
      _width += i.padding.horizontal;
      _width += i.margin.horizontal;
      _width += 8;
    }
    return Container(
      decoration: decoration,
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      width: _width,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        tilePadding: const EdgeInsets.symmetric(horizontal: 8),
        expandedAlignment: Alignment.centerLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        controlAffinity: tileControlAffinity,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List<Widget>.generate(title.length, (index) {
            return title[index];
          }),
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
