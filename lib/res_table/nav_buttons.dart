import 'package:flutter/material.dart';

class NavButtons extends StatelessWidget {
  const NavButtons(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              const Size(200, 60),
            ),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.lightBlue[200];
              }
              return Colors.white54;
            })),
        onPressed: () {
          print('1');
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
