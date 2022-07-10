import 'package:flutter/material.dart';
import 'package:res_table/res_table/cell.dart';

class ExpandedCell extends StatefulWidget {
  const ExpandedCell({
    Key? key,
    required this.title,
    required this.children,
    this.verticalMargin = 0,
    this.decoration = const BoxDecoration(),
    this.tileControlAffinity = ListTileControlAffinity.leading,
  }) : super(key: key);

  final List<Widget> children;
  final List title;
  final ListTileControlAffinity tileControlAffinity;
  final BoxDecoration decoration;
  final double verticalMargin;

  @override
  State<ExpandedCell> createState() => _ExpandedCellState();
}

class _ExpandedCellState extends State<ExpandedCell>
    with SingleTickerProviderStateMixin {
  final ScrollController controller = ScrollController();
  late AnimationController a;

  @override
  void initState() {
    a = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = 0;
    for (var i in widget.title) {
      _width += i.size.width;
      _width += i.padding.horizontal;
      _width += i.margin.horizontal;
      _width += 8;
    }
    List newList = [
      if (widget.children.isNotEmpty &&
          widget.tileControlAffinity == ListTileControlAffinity.leading)
        SizedBox(
          width: 50,
          height: 60,
          child: Center(child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: a)),
        ),
      for (var item in widget.title) item,
      if (widget.children.isNotEmpty &&
          widget.tileControlAffinity == ListTileControlAffinity.trailing)
        SizedBox(
          width: 50,
          height: 60,
          child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: a),
        ),
    ];
    return Container(
      decoration: widget.decoration,
      margin: EdgeInsets.symmetric(vertical: widget.verticalMargin),
      width: _width,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        tilePadding: const EdgeInsets.symmetric(horizontal: 8),
        onExpansionChanged: (value) {
          if (value) {
            a.forward();
          } else {
            a.reverse();
          }
        },
        expandedAlignment: Localizations.localeOf(context).languageCode == 'ar'
            ? Alignment.centerRight
            : Alignment.centerLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        leading: const SizedBox(),
        trailing: const SizedBox(),
        controlAffinity: null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List<Widget>.generate(
            newList.length,
            (index) {
              return Flexible(
                child: newList[index],
              );
            },
          ),
        ),
        children: [
          Scrollbar(
            controller: controller,
            scrollbarOrientation: ScrollbarOrientation.bottom,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.children,
              ),
            ),
          )
        ],
      ),
    );
  }
}
