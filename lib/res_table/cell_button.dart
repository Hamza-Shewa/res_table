import 'package:flutter/material.dart';

class CellButton extends StatelessWidget {
  ///[buttonStyle] overrides the [buttonSize] parameter
  const CellButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.buttonStyle,
    this.buttonSize = const Size(200, 60),
    this.hoverColor = Colors.lightBlue,
    this.color = Colors.white54,
  }) : super(key: key);

  final ButtonStyle? buttonStyle;
  final Widget child;
  final VoidCallback onPressed;
  final Size buttonSize;
  final Color hoverColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: buttonStyle ??
            ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                buttonSize,
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.hovered)) {
                    return hoverColor.withOpacity(0.2);
                  }
                  return color;
                },
              ),
            ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
