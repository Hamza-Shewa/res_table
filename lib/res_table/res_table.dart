import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'cell.dart';

class ResTable extends StatelessWidget {
  ResTable({
    Key? key,
    required this.header,
    required this.children,
  }) : super(key: key);
  final ScrollController _controller = ScrollController();
  final List<Widget> header;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
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
                width: (6 * 200) + (10 * 2 * 6),
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
                    children:children
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
