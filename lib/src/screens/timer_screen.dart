import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lttimer/src/app_router.dart';
import 'package:lttimer/src/screens/timer_controller.dart';
import 'package:lttimer/src/ui/countdown_timer.dart';

class TimerScreen extends ConsumerWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isReset =
        ref.watch(timerControllerProvider.select((value) => value.isReset));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 18),
                    child: IconButton(
                      icon: const Icon(
                        Icons.settings,
                        size: 32,
                      ),
                      onPressed: isReset
                          ? () {
                              context.pushNamed(AppRoute.settings.name);
                            }
                          : null,
                    ),
                  )
                ],
              ),
              const Center(
                child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: AspectRatio(
                        aspectRatio: 0.85, child: CountdownTimer())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
