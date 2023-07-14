import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lttimer/src/screens/timer_controller.dart';

class StartStopButton extends ConsumerWidget {
  const StartStopButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRunning =
        ref.watch(timerControllerProvider.select((value) => value.isRunning));

    final inFinalCountdown = ref.watch(
        timerControllerProvider.select((value) => value.startFinalCountdown));

    return Visibility(
      visible: !inFinalCountdown,
      child: ClipOval(
        child: Material(
          color: isRunning
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.secondary,
          child: InkWell(
            onTap: onPressed,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                isRunning ? 'Stop' : 'Start',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
