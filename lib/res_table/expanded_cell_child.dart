import 'package:flutter/material.dart';

class ExpandedCellChild extends StatelessWidget {
  const ExpandedCellChild({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black54.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 80,
      width: 200,
      child: child,
    );
  }
}
