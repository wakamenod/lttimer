import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lttimer/src/audio/audio_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'settings_controller.dart';

part 'timer_controller.freezed.dart';
part 'timer_controller.g.dart';

@freezed
class Timer with _$Timer {
  const Timer._();

  const factory Timer({
    // 経過時間
    // NOTE SingleTickerProviderStateMixinではtickerをstopすると渡される
    //      経過時間が0に戻るので、stop前の経過時間を足して扱う(_elapsed参照)
    required Duration currentElapsed,
    required Duration prevElapsed,
    // タイマーで計測する時間
    required Duration timerDuration,
    // タイマー起動中か
    required bool isRunning,
    // 最後のカウントダウンを開始したか
    required bool startFinalCountdown,
    // 連続セッションでのインターバル中か
    required bool isInterval,
    // アニメーションを表示するか
    required bool showAnimation,
    // リセット状態か
    required bool isReset,
    // ベルの音を管理するキュー
    required Queue<Duration> bellsQueue,
  }) = _Timer;

  Duration get _elapsed => currentElapsed + prevElapsed;

  // タイマーの残り時間
  Duration get countdown =>
      _elapsed > timerDuration ? Duration.zero : timerDuration - _elapsed;
}

@riverpod
class TimerController extends _$TimerController {
  Duration get _sessionTime =>
      ref.read(settingsControllerProvider.notifier).selectedSessionTime;

  Duration get _intervalSeconds =>
      ref.read(settingsControllerProvider).intervalTime;

  List<Duration> get _validBellsSorted =>
      ref.read(settingsControllerProvider.notifier).validBellsSorted;

  @override
  Timer build() {
    return Timer(
      currentElapsed: Duration.zero,
      prevElapsed: Duration.zero,
      timerDuration: _sessionTime,
      isRunning: false,
      isInterval: false,
      bellsQueue: Queue.from(_validBellsSorted),
      startFinalCountdown: false,
      showAnimation: false,
      isReset: true,
    );
  }

  // タイマーの開始
  void start() {
    state = state.copyWith(
      isRunning: true,
      isReset: false,
    );
  }

  // タイマーの一時停止
  void stop() {
    state = state.copyWith(
      isRunning: false,
      prevElapsed: state.prevElapsed + state.currentElapsed,
      currentElapsed: Duration.zero,
    );
  }

  // タイマーのリセット
  void reset() {
    state = state.copyWith(
      prevElapsed: Duration.zero,
      currentElapsed: Duration.zero,
      timerDuration: _sessionTime,
      bellsQueue: Queue.from(_validBellsSorted),
      startFinalCountdown: false,
      isReset: true,
    );
  }

  void toggleInterval() {
    final isInterval = !state.isInterval;
    final timerDuration = isInterval ? _intervalSeconds : _sessionTime;
    state = state.copyWith(
      isInterval: isInterval,
      timerDuration: timerDuration,
    );
  }

  void endInterval() {
    state = state.copyWith(
      isInterval: false,
    );
  }

  void elapse(Duration elapsed) {
    state = state.copyWith(
      currentElapsed: elapsed,
    );
  }

  bool get timerFinished => state.countdown == Duration.zero && state.isRunning;

  // 適切なタイミングでベルを鳴らす
  void ringBellIfNeeded() {
    if (state.bellsQueue.isEmpty) return;
    if (state.isInterval) return;

    final bell = state.bellsQueue.first;
    if (bell.inSeconds != state._elapsed.inSeconds) return;

    state.bellsQueue.removeFirst();
    ref.read(audioManagerProvider).playBell();
  }

  // 適切なタイミングでカウントダウンを開始する
  void startFinalCountdownIfNeeded() {
    if (state.isInterval) return;
    if ((state.countdown.inMilliseconds / 1000).round() <= 5) {
      state = state.copyWith(
        startFinalCountdown: true,
      );
    }
  }

  // 適切なタイミングでセッション終了時のアニメーションを表示する
  Future<void> showCongratsAnimationIfNeeded() async {
    if (!timerFinished) return;
    if (!ref.read(settingsControllerProvider).showCongratsAnimation) return;
    if (state.isInterval) return;

    state = state.copyWith(
      showAnimation: true,
    );

    try {
      ref.read(audioManagerProvider).playClapping();
    } catch (e) {
      debugPrint(e.toString());
    }

    await Future.delayed(const Duration(seconds: 5));

    state = state.copyWith(
      showAnimation: false,
    );
  }
}
