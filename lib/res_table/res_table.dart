import 'package:demo/res_table/expanded_cell.dart';
import 'package:flutter/material.dart';

class ResTable extends StatelessWidget {
  ResTable({
    Key? key,
    required this.header,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;
  final List<Widget> header;

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    ExpandedCell child = children.first as ExpandedCell;
    return Flexible(
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
                    (((child.childPadding.horizontal / 2) + 2) *
                        2 *
                        header.length.toDouble()),
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
                  child: Column(children: children),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
