import 'package:flutter/material.dart';
import 'package:res_table/res_table.dart';

class ResTable extends StatelessWidget {
  ResTable({
    Key? key,
    required this.header,
    required this.children,
    this.backgroundColor = Colors.transparent,
    this.tableDecoration = const BoxDecoration(),
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.flex = 1,
    this.fillWidth = false,
  }) : super(key: key);

  final List<Widget> children;
  final List<Cell> header;
  final Color backgroundColor;
  final BoxDecoration tableDecoration;
  final ScrollController _controller = ScrollController();
  final EdgeInsets padding;
  final EdgeInsets margin;
  final int flex;
  final bool fillWidth;

  @override
  Widget build(BuildContext context) {
    double _width = 0;
    for (var element in header) {
      _width += element.size.width;
      _width += element.padding.horizontal;
      _width += element.margin.horizontal;
      _width += 8;
    }
    return Flexible(
      flex: flex,
      child: Container(
        width: fillWidth ? double.infinity : null,
        decoration: tableDecoration.copyWith(
          color: backgroundColor,
        ),
        alignment: fillWidth ? Alignment.center : null,
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
                  width: _width,
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                    trailing: const SizedBox(),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
