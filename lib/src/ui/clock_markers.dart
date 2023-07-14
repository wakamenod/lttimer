import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondsTicMarker extends StatelessWidget {
  const ClockSecondsTicMarker(
      {super.key, required this.seconds, required this.radius});

  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0
        ? Theme.of(context).colorScheme.tertiary
        : Colors.grey[700];
    const width = 2.0;
    const height = 12.0;
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(-width / 2, -height / 2, 0.0)
          ..rotateZ(seconds * (2 * pi / 60))
          ..translate(0.0, radius - height / 2),
        child: Container(width: width, height: height, color: color));
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker(
      {super.key,
      required this.value,
      required this.textValue,
      required this.maxValue,
      required this.radius});
  final int value;
  final int textValue;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const width = 40.0;
    const height = 30.0;
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(-width / 2, -height / 2, 0.0)
          ..rotateZ(pi + pi * 2 * (value / maxValue))
          ..translate(0.0, radius - 35)
          ..rotateZ(pi - pi * 2 * (value / maxValue)),
        child: SizedBox(
          width: width,
          height: height,
          child: Text(
            textValue.toString(),
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
