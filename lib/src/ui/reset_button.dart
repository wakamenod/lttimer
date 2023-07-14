import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lttimer/src/screens/timer_controller.dart';

class ResetButton extends ConsumerWidget {
  const ResetButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRunning =
        ref.watch(timerControllerProvider.select((value) => value.isRunning));

    return Visibility(
      visible: !isRunning,
      child: ClipOval(
        child: Material(
          color: Theme.of(context).colorScheme.surface,
          child: InkWell(
            onTap: onPressed,
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'Reset',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
