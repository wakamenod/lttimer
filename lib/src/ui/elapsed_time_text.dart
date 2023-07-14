import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lttimer/i18n/translations.g.dart';
import 'package:lttimer/src/screens/settings_controller.dart';
import 'package:lttimer/src/screens/timer_controller.dart';

class ElapsedTimeText extends ConsumerWidget {
  const ElapsedTimeText({required this.radius, super.key});

  final double radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingsControllerProvider);
    final timer = ref.watch(timerControllerProvider);

    double fontSize = radius / 4;

    final seconds = (timer.countdown.inMilliseconds / 1000).round() % 60;
    final minutes =
        ((timer.countdown.inMilliseconds / 1000).round() / 60).floor();
    final secondsStr = seconds.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    return Visibility(
      visible: !timer.startFinalCountdown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            minutesStr,
            style: TextStyle(fontSize: fontSize),
            textAlign: TextAlign.center,
          ),
          Text(
            t.timer.min,
            style: GoogleFonts.zenKakuGothicNew(fontSize: fontSize * 0.45),
            textAlign: TextAlign.center,
          ),
          Text(
            secondsStr,
            style: TextStyle(fontSize: fontSize),
            textAlign: TextAlign.center,
          ),
          Text(
            t.timer.sec,
            style: GoogleFonts.zenKakuGothicNew(fontSize: fontSize * 0.45),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CountdownSecondText extends ConsumerWidget {
  const CountdownSecondText({required this.radius, super.key});

  final double radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingsControllerProvider);
    final timer = ref.watch(timerControllerProvider);

    double fontSize = radius / 4;

    final settings = ref.watch(settingsControllerProvider);
    final pad = settings.sessionTime.inSeconds > 60 ? 3 : 2;
    final seconds = (timer.countdown.inMilliseconds / 1000).round();
    final secondsStr = seconds.toString().padLeft(pad, '0');
    return Visibility(
      visible: !timer.startFinalCountdown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            secondsStr,
            style: TextStyle(fontSize: fontSize),
            textAlign: TextAlign.center,
          ),
          Text(
            t.timer.sec,
            style: GoogleFonts.zenKakuGothicNew(fontSize: fontSize * 0.45),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// class TimeDigit extends StatelessWidget {
//   const TimeDigit(
//     this.text, {
//     super.key,
//     required this.width,
//   });
//   final String text;
//   final double width;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       child: Text(
//         text,
//         style: TextStyle(fontSize: width * 1.2),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }
