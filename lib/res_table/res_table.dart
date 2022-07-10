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
    this.margin = const EdgeInsets.all(8),
    this.flex = 1,
    this.fillWidth = false,
    this.fillHeight = true,
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
  final bool fillHeight;

  @override
  Widget build(BuildContext context) {
    double _width = 0;
    for (var element in header) {
      _width += element.size.width;
      _width += element.padding.horizontal;
      _width += element.margin.horizontal;
      _width += 8;
    }
    ExpandedCell item = children.first as ExpandedCell;

    List<Cell> newList = [
      if (item.tileControlAffinity == ListTileControlAffinity.leading)
        const Cell(
          text: '',
          size: Size(50, 60),
        ),
      for (Cell item in header) item,
      if (item.tileControlAffinity == ListTileControlAffinity.trailing)
        const Cell(
          text: '',
          size: Size(50, 60),
        ),
    ];
    return Flexible(
      flex: flex,
      child: Container(
        width: fillWidth ? double.infinity : null,
        decoration: tableDecoration.copyWith(
          color: backgroundColor,
        ),
        alignment: fillWidth
            ? fillHeight
                ? Alignment.center
                : null
            : null,
        padding: padding,
        margin: margin,
        child: Scrollbar(
          controller: _controller,
          thumbVisibility: true,
          scrollbarOrientation: ScrollbarOrientation.top,
          child: SingleChildScrollView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisSize: fillHeight ? MainAxisSize.max : MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: _width,
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                    trailing: const SizedBox(),
                    leading: const SizedBox(),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List<Widget>.generate(
                        item.children.isEmpty ? header.length : newList.length,
                        (index) {
                          return Flexible(
                            child: item.children.isEmpty
                                ? header[index]
                                : newList[index],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize:
                          fillHeight ? MainAxisSize.max : MainAxisSize.min,
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
