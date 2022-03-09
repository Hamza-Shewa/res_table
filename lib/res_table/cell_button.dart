import 'package:flutter/material.dart';

import '../theme/res_table.dart';

class CellButton extends StatelessWidget {
  ///[buttonStyle] overrides the [buttonSize],[color],[hoverColor] parameters
  CellButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.buttonStyle,
    this.buttonSize = const Size(200, 60),
    this.hoverColor,
    this.color,
  }) : super(key: key);

  final ButtonStyle? buttonStyle;
  final Widget child;
  final VoidCallback onPressed;
  final Size buttonSize;
  late Color? hoverColor;
  late Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: buttonStyle ??
            Theme.of(context).textButtonTheme.style!.copyWith(
                  fixedSize: MaterialStateProperty.all(
                    buttonSize,
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.hovered)) {
                        hoverColor ??= ResTable.primary.withOpacity(0.2);
                        return hoverColor;
                      }
                      color ??= ResTable.secondryLight.withOpacity(0.25);
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
