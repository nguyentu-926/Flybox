import 'package:flightbookapp/core/res/styles/app_theme.dart';
import 'package:flutter/material.dart';

class CircleHalf extends StatelessWidget {
  final bool isRight;
  final Color color;

  const CircleHalf(
      {super.key, required this.isRight, this.color = AppTheme.bgColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 10,
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: color,
              borderRadius: isRight == true
                  ? BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))
                  : BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)))),
    );
  }
}
