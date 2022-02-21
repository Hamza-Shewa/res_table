import 'package:flutter/material.dart';

class CellButton extends StatelessWidget {
  const CellButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.buttonStyle})
      : super(key: key);

  final ButtonStyle? buttonStyle;
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: buttonStyle ??
            ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  const Size(200, 60),
                ),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.lightBlue[200];
                  }
                  return Colors.white54;
                })),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
