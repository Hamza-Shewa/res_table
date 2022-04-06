import 'package:flutter/material.dart';

class CellButtonIcon extends StatelessWidget {
  const CellButtonIcon({
    Key? key,
    required this.child,
    required this.onPressed,
    this.hoverColor = Colors.transparent,
    this.color,
    this.size = const Size(100, 60),
    this.padding = const EdgeInsets.all(2.0),
    this.margin = const EdgeInsets.all(0.0),

  }) : super(key: key);

  final Icon child;
  final VoidCallback onPressed;
  final Color hoverColor;
  final Color? color;
  final Size size;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: size.width,
      height: size.height,
      child: IconButton(
        hoverColor: hoverColor,
        color: color ?? Theme.of(context).primaryColor,
        onPressed: onPressed,
        icon: child,
      ),
    );
  }
}
