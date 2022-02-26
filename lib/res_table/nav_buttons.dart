import 'package:flutter/material.dart';

class NavButtons extends StatelessWidget {
  const NavButtons({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: TextButton(
        style: Theme.of(context).textButtonTheme.style!.copyWith(
              fixedSize: MaterialStateProperty.all(
                const Size(250, 60),
              ),
            ),
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}
