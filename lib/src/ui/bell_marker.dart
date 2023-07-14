import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BellMarker extends ConsumerWidget {
  final double radius;
  final double angle;

  const BellMarker({required this.radius, required this.angle, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const size = 30.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-size / 2, -size / 2, 0.0)
        ..rotateZ(angle)
        ..translate(0.0, radius)
        ..rotateZ(-angle),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          width: size - 5,
          height: size - 5,
          decoration: BoxDecoration(
            color: Colors.yellow[300],
            shape: BoxShape.circle,
          ),
        ),
        Icon(
          Icons.circle_notifications,
          size: size,
          color: Colors.grey[900],
        ),
      ]),
    );
  }
}
