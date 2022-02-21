import 'package:flutter/material.dart';

class ExpandedCellChild extends StatelessWidget {
  const ExpandedCellChild({
    Key? key,
    required this.child,
    this.cardSize = const Size(200, 80),
    this.cardDecoration,
    this.margin = const EdgeInsets.symmetric(horizontal: 4),
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  final Widget child;
  final Size cardSize;
  final BoxDecoration? cardDecoration;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration ??
          BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.black54.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
      margin: margin,
      padding: padding,
      height: cardSize.height,
      width: cardSize.width,
      child: child,
    );
  }
}
