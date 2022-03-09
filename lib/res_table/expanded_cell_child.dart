import 'package:flutter/material.dart';

class ExpandedCellChild extends StatelessWidget {
  const ExpandedCellChild({
    Key? key,
    required this.child,
    this.color = Colors.transparent,
    this.cardSize = const Size(200, 80),
    this.cardDecoration = const BoxDecoration(),
    this.margin = const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  final Widget child;
  final Size cardSize;
  final BoxDecoration cardDecoration;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration.copyWith(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: Colors.black54.withOpacity(0.2),
        ),
      ),
      margin: margin,
      padding: padding,
      height: cardSize.height,
      width: cardSize.width,
      child: child,
    );
  }
}
