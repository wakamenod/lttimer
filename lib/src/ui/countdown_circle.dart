import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lttimer/src/persistence/settings.dart';
import 'package:lttimer/src/screens/settings_controller.dart';
import 'package:lttimer/src/screens/timer_controller.dart';

class CountdownCircle extends ConsumerWidget {
  const CountdownCircle({
    super.key,
    required this.radius,
  });
  final double radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerControllerProvider);
    final settings = ref.watch(settingsControllerProvider);

    return CustomPaint(
      painter: settings.sessionMode == TimerType.long && !timer.isInterval
          ? _MinutesCirclePainter(
              timer: timer,
              radius: radius,
              color: Colors.orange,
            )
          : _CirclePainter(
              timer: timer,
              radius: radius,
              color: timer.isInterval ? Colors.pink : Colors.orange,
            ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final Timer timer;
  final double radius;
  final Color color;

  _CirclePainter(
      {required this.timer, required this.radius, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    final angle = (2 * pi / (timer.timerDuration.inMilliseconds)) *
        timer.countdown.inMilliseconds;

    canvas.drawArc(
      Rect.fromCircle(
        center: size.center(Offset.zero),
        radius: radius,
      ),
      -pi / 2,
      angle,
      false,
      paint,
    );

    final Offset circleCenter = Offset(
      size.center(Offset.zero).dx + radius * cos(-pi / 2 + angle),
      size.center(Offset.zero).dy + radius * sin(-pi / 2 + angle),
    );

    canvas.drawCircle(circleCenter, 2.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _MinutesCirclePainter extends CustomPainter {
  final Timer timer;
  final double radius;
  final Color color;

  _MinutesCirclePainter({
    required this.timer,
    required this.radius,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    final double arcAngle = ((2 * pi) *
            (timer.timerDuration.inMinutes / 60) /
            timer.timerDuration.inMilliseconds) *
        timer.countdown.inMilliseconds;
    canvas.drawArc(
      Rect.fromCircle(
        center: size.center(Offset.zero),
        radius: radius,
      ),
      -pi / 2,
      arcAngle,
      false,
      paint,
    );

    final Offset circleCenter = Offset(
      size.center(Offset.zero).dx + radius * cos(-pi / 2 + arcAngle),
      size.center(Offset.zero).dy + radius * sin(-pi / 2 + arcAngle),
    );

    canvas.drawCircle(circleCenter, 2.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
