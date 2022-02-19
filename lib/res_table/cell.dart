import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200.0,
      height: 60.0,
      color: Colors.white,
      margin: const EdgeInsets.all(2.0),
      child: Text(text, style: Theme.of(context).textTheme.bodyText2),
    );
  }
}
