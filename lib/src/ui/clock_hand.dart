import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  const ClockHand(
      {super.key,
      required this.rotationZAngle,
      required this.handThickness,
      required this.handLength,
      required this.color});
  final double rotationZAngle;
  final double handThickness;
  final double handLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(handThickness / 2, 0.0, 0.0)
        ..rotateZ(rotationZAngle),
      child: Container(
        height: handLength,
        width: handThickness,
        color: color,
      ),
    );
  }
}
