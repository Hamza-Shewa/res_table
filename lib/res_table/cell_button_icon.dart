import 'package:flutter/material.dart';

class CellButtonIcon extends StatelessWidget {
  const CellButtonIcon({
    Key? key,
    required this.child,
    required this.onPressed,
    this.hoverColor,
    this.color = Colors.transparent,
    this.size = const Size(100, 60),
    this.padding = const EdgeInsets.all(2.0),
    this.margin = const EdgeInsets.all(0.0),
  }) : super(key: key);

  final Icon child;
  final VoidCallback onPressed;
  final Color? hoverColor;
  final Color color;
  final Size size;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: TextButton(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStateProperty.all(
            CircleBorder(
              side: BorderSide(
                color: color,
                width: 2.0,
              ),
            ),
          ),
          fixedSize: MaterialStateProperty.all(
            size,
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return hoverColor ??
                  Theme.of(context).primaryColorDark.withOpacity(0.2);
            }
            return color;
          }),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
