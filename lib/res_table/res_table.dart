import 'package:demo/res_table/expanded_cell.dart';
import 'package:flutter/material.dart';

class ResTable extends StatelessWidget {
  ResTable({
    Key? key,
    required this.header,
    required this.children,
    this.backgroundColor = Colors.transparent,
    this.tableDecoration = const BoxDecoration(),
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  final List<Widget> children;
  final List<Widget> header;
  final Color backgroundColor;
  final BoxDecoration tableDecoration;
  final ScrollController _controller = ScrollController();
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    ExpandedCell child = children.first as ExpandedCell;
    final _padding = child.childPadding.horizontal == 0
        ? child.childPadding.vertical
        : child.childPadding.horizontal;
    return Flexible(
      child: Container(
        decoration: tableDecoration.copyWith(
          color: backgroundColor,
        ),
        padding: padding,
        margin: margin,
        child: Scrollbar(
          controller: _controller,
          isAlwaysShown: true,
          scrollbarOrientation: ScrollbarOrientation.top,
          child: SingleChildScrollView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: (header.length * 200) +
                      (((_padding / 2) + 2) * 2 * header.length.toDouble()),
                  child: ExpansionTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    leading: const SizedBox(),
                    title: Row(
                      children: header,
                    ),
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: children,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
