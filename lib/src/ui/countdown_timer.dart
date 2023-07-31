import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lttimer/src/screens/settings_controller.dart';
import 'package:lttimer/src/screens/timer_controller.dart';
import 'package:lttimer/src/ui/animation_layer.dart';
import 'package:lttimer/src/ui/danmaku_layer.dart';

import 'reset_button.dart';
import 'start_stop_button.dart';
import 'timer_renderer.dart';

class CountdownTimer extends ConsumerStatefulWidget {
  const CountdownTimer({super.key});

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends ConsumerState<CountdownTimer>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  bool showAnimation = false;

  void _toggleRunning() {
    ref.read(timerControllerProvider).isRunning ? _stop() : _start();
  }

  void _start() {
    _ticker.start();
    ref.read(timerControllerProvider.notifier).start();
  }

  void _stop() {
    _ticker.stop();
    ref.read(timerControllerProvider.notifier).stop();
  }

  void _reset({bool endInterval = false}) {
    _ticker.stop();
    final controller = ref.read(timerControllerProvider.notifier);
    controller.reset();
    if (endInterval) {
      controller.endInterval();
    }
  }

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      final controller = ref.read(timerControllerProvider.notifier);
      controller.elapse(elapsed);

      // カウントダウン開始判定
      controller.startFinalCountdownIfNeeded();
      // ベル判定
      controller.ringBellIfNeeded();

      if (controller.timerFinished) {
        // アニメーション開始判定
        controller.showCongratsAnimationIfNeeded();
        _reset();
        if (ref.read(settingsControllerProvider).isContinuous) {
          controller.toggleInterval();
          _start();
        }
      }
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showAnimation = ref
        .watch(timerControllerProvider.select((value) => value.showAnimation));
    final showDanmaku = ref.watch(settingsControllerProvider
        .select((value) => value.congratsDanmakuComments.isNotEmpty));

    return LayoutBuilder(builder: (context, constraints) {
      final radius = constraints.maxWidth / 2 - 10;
      return Stack(
        children: [
          Positioned(
            top: 10,
            bottom: 0,
            left: 10,
            right: 0,
            child: TimerRenderer(
              radius: radius,
            ),
          ),
          if (showAnimation)
            AnimationLayer(
                width: constraints.maxWidth, height: constraints.maxHeight),
          if (showAnimation && showDanmaku)
            DanmakuLayer(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 80,
              height: 80,
              child: ResetButton(
                onPressed: () {
                  _reset(endInterval: true);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80,
              height: 80,
              child: StartStopButton(
                onPressed: _toggleRunning,
              ),
            ),
          )
        ],
      );
    });
  }
}
