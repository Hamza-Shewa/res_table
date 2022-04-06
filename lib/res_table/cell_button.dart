import 'package:flutter/material.dart';

class CellButton extends StatelessWidget {
  ///[buttonStyle] is overridden by the [size],[color],[hoverColor] parameters
  const CellButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.buttonStyle = const ButtonStyle(),
    this.size = const Size(200, 60),
    this.hoverColor = Colors.transparent,
    this.color = Colors.transparent,
    this.padding = const EdgeInsets.all(2.0),
    this.margin = const EdgeInsets.all(0.0),
  }) : super(key: key);

  final ButtonStyle? buttonStyle;
  final Widget child;
  final VoidCallback onPressed;
  final Size size;
  final Color hoverColor;
  final Color color;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: TextButton(
        style: buttonStyle!.copyWith(
          fixedSize: MaterialStateProperty.all(
            size,
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) return hoverColor;
            return color;
          }),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
