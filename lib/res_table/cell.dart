import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    Key? key,
    required this.text,
    this.size = const Size(200, 60),
    this.margin = const EdgeInsets.all(2.0),
    this.padding = const EdgeInsets.all(0),
    this.textStyle,
    this.decoration = const BoxDecoration(),
  }) : super(key: key);

  final String text;
  final Size size;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size.width,
      height: size.height,
      decoration: decoration,
      margin: margin,
      padding: padding,
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ),
    );
  }
}
