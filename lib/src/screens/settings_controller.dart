import 'dart:math';

import 'package:lttimer/i18n/translations.g.dart';
import 'package:lttimer/src/persistence/hive_data_store.dart';
import 'package:lttimer/src/persistence/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  @override
  Settings build() {
    return ref.read(dataStoreProvider).settings();
  }

  void onSetSessionMode(bool isLong) {
    state = state.copyWith(
        sessionMode: isLong ? TimerType.long : TimerType.lightning);
    ref.read(dataStoreProvider).setSettings(state);
  }

  void onSetSessionMinutes(int index) {
    state = isLongSession
        ? state.copyWith(longSessionTime: TimerType.long.selectableTimes[index])
        : state.copyWith(
            sessionTime: TimerType.lightning.selectableTimes[index]);
    ref.read(dataStoreProvider).setSettings(state);
  }

  void onSetIsContinuous(bool isContinuous) {
    state = state.copyWith(isContinuous: isContinuous);
    ref.read(dataStoreProvider).setSettings(state);
  }

  void onSetInterval(int index) {
    final t = TimerType.interval.selectableTimes[index];
    state = state.copyWith(intervalTime: t);
    ref.read(dataStoreProvider).setSettings(state);
  }

  void onSetBell1(duration) {
    state = isLongSession
        ? state.copyWith(longModeBell1: duration)
        : state.copyWith(bell1: duration);
    ref.read(dataStoreProvider).setSettings(state);
  }

  void onSetBell2(duration) {
    state = isLongSession
        ? state.copyWith(longModeBell2: duration)
        : state.copyWith(bell2: duration);
    ref.read(dataStoreProvider).setSettings(state);
  }

  void onSetBell3(duration) {
    state = isLongSession
        ? state.copyWith(longModeBell3: duration)
        : state.copyWith(bell3: duration);
    ref.read(dataStoreProvider).setSettings(state);
  }

  void onResetBell1() => onSetBell1(Duration.zero);
  void onResetBell2() => onSetBell2(Duration.zero);
  void onResetBell3() => onSetBell3(Duration.zero);

  void onSetDarkMode(isDarkMode) {
    state = state.copyWith(isDarkMode: isDarkMode);
    ref.read(dataStoreProvider).setSettings(state);
  }

  void onSetShowCongratsAnimation(showCongratsAnimation) {
    state = state.copyWith(showCongratsAnimation: showCongratsAnimation);
    ref.read(dataStoreProvider).setSettings(state);
  }

  // 発表時間内に含まれるベルの時間を取得
  List<Duration> get validBellsSorted {
    final bells = isLongSession
        ? [state.longModeBell1, state.longModeBell2, state.longModeBell3]
        : [state.bell1, state.bell2, state.bell3];
    final res = bells
        .where((bell) => Duration.zero < bell && bell < selectedSessionTime)
        .toList();
    res.sort();
    return res;
  }

  // タイマー上のベルの角度を取得 (発表時間内に含まれるベルのみ)
  List<double> get bellRotateAngles {
    return validBellsSorted
        .map((bell) => isLongSession
            ? (pi +
                (state.longSessionTime.inMinutes - bell.inMinutes) *
                    (2 * pi / 60))
            : (pi +
                (state.sessionTime.inSeconds - bell.inSeconds) *
                    (2 * pi / state.sessionTime.inSeconds)))
        .toList();
  }

  // 選択可能な分数リスト
  List<String> get selectableSessionTimes => isLongSession
      ? TimerType.long.selectableTimes
          .map((d) => t.settings.min(min: d.inMinutes))
          .toList()
      : TimerType.lightning.selectableTimes
          .map((d) =>
              '${t.settings.sec(sec: d.inSeconds)} (${t.settings.min(min: d.inSeconds / 60)})')
          .toList();

  // 分数よりリスト内のindexを取得
  int get indexOfSelectedSessionMinutes => isLongSession
      ? TimerType.long.selectableTimes.indexOf(state.longSessionTime)
      : TimerType.lightning.selectableTimes.indexOf(state.sessionTime);

  // 現在選択中の発表時間(分)
  Duration get selectedSessionTime =>
      isLongSession ? state.longSessionTime : state.sessionTime;

  // 現在選択中の発表時間ラベル
  String get selectedSessionTimeLabel => isLongSession
      ? t.settings.min(min: state.longSessionTime.inMinutes)
      : t.settings.sec(sec: state.sessionTime.inSeconds);

  bool get isLongSession => state.sessionMode == TimerType.long;

  // 選択可能なインターバル秒
  List<String> get selectableIntervals => TimerType.interval.selectableTimes
      .map((e) => t.settings.sec(sec: e.inSeconds))
      .toList();

  // 分数よりリスト内のindexを取得
  int get indexOfInterval =>
      TimerType.interval.selectableTimes.indexOf(state.intervalTime);

  String _bellText(Duration bell) => t.settings.bellSection.timeElapsed(
      time: t.settings.sec(sec: bell == Duration.zero ? '-' : bell.inSeconds));
  String _longModeBellText(Duration bell) => t.settings.bellSection.timeElapsed(
      time: t.settings.min(min: bell == Duration.zero ? '-' : bell.inMinutes));

  Duration get bell1 => isLongSession ? state.longModeBell1 : state.bell1;
  Duration get bell2 => isLongSession ? state.longModeBell2 : state.bell2;
  Duration get bell3 => isLongSession ? state.longModeBell3 : state.bell3;

  String bellText(Duration bell) =>
      isLongSession ? _longModeBellText(bell) : _bellText(bell);

  String get bell1Text => bellText(bell1);
  String get bell2Text => bellText(bell2);
  String get bell3Text => bellText(bell3);

  int clockTextMarkerValue(i) =>
      isLongSession ? i : i * state.sessionTime.inMinutes;
}
