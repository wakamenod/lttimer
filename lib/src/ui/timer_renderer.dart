import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lttimer/src/screens/settings_controller.dart';
import 'package:lttimer/src/screens/timer_controller.dart';
import 'package:lttimer/src/ui/bell_marker.dart';
import 'package:lttimer/src/ui/countdown_circle.dart';

import 'clock_markers.dart';
import 'elapsed_time_text.dart';
import 'message_text.dart';

class TimerRenderer extends ConsumerWidget {
  final double radius;
  const TimerRenderer({super.key, required this.radius});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInterval =
        ref.watch(timerControllerProvider.select((value) => value.isInterval));
    final showAnimation = ref
        .watch(timerControllerProvider.select((value) => value.showAnimation));
    final controller = ref.watch(settingsControllerProvider.notifier);
    ref.watch(settingsControllerProvider);

    return Stack(
      children: [
        if (!isInterval && !showAnimation)
          for (var i = 0; i < 60; i++)
            Positioned(
                left: radius,
                top: radius,
                child: ClockSecondsTicMarker(seconds: i, radius: radius)),
        if (!isInterval && !showAnimation)
          for (var i = 5; i <= 60; i += 5)
            Positioned(
                left: radius,
                top: radius,
                child: ClockTextMarker(
                  value: i,
                  textValue: controller.clockTextMarkerValue(i),
                  maxValue: 60,
                  radius: radius,
                )),
        Positioned(
          top: radius - 40,
          child: MessageText(
            radius: radius,
          ),
        ),
        Positioned(
          left: radius,
          top: radius,
          child: CountdownCircle(
            radius: radius,
          ),
        ),
        if (!isInterval && !showAnimation)
          for (final bellAngle in controller.bellRotateAngles)
            Positioned(
                left: radius,
                top: radius,
                child: BellMarker(
                  radius: radius,
                  angle: bellAngle,
                )),
        if (!showAnimation)
          Positioned(
              left: 0,
              right: 0,
              top: radius - radius / 8,
              child: controller.isLongSession
                  ? ElapsedTimeText(
                      radius: radius,
                    )
                  : CountdownSecondText(
                      radius: radius,
                    )),
      ],
    );
  }
}
