import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 1)
enum TimerType {
  @HiveField(0)
  lightning(defaultTime: Duration(minutes: 2)),
  @HiveField(1)
  long(defaultTime: Duration(minutes: 30)),
  @HiveField(2)
  interval(defaultTime: Duration(seconds: 30));

  const TimerType({
    required this.defaultTime,
  });

  // デフォルト
  final Duration defaultTime;
}

extension TimerModeX on TimerType {
  // ユーザーが設定画面から選択できる時間
  List<Duration> get selectableTimes {
    switch (this) {
      case TimerType.lightning:
        return List<Duration>.generate(
            10, (idx) => Duration(seconds: (idx + 1) * 60));
      case TimerType.long:
        return List<Duration>.generate(
            50, (idx) => Duration(minutes: idx + 11));
      case TimerType.interval:
        return [15, 30, 45, 60, 90, 120, 180, 240, 300]
            .map((s) => Duration(seconds: s))
            .toList();
    }
  }
}

@HiveType(typeId: 0)
class Settings {
  Settings(
      {required this.sessionMode,
      required this.sessionTime,
      required this.longSessionTime,
      required this.isContinuous,
      required this.intervalTime,
      required this.bell1,
      required this.bell2,
      required this.bell3,
      required this.longModeBell1,
      required this.longModeBell2,
      required this.longModeBell3,
      required this.isDarkMode,
      required this.showCongratsAnimation});
  factory Settings.defaults() {
    return Settings(
        sessionMode: TimerType.lightning,
        sessionTime: TimerType.lightning.defaultTime,
        longSessionTime: TimerType.long.defaultTime,
        intervalTime: TimerType.interval.defaultTime,
        isContinuous: true,
        bell1: Duration.zero,
        bell2: Duration.zero,
        bell3: Duration.zero,
        longModeBell1: Duration.zero,
        longModeBell2: Duration.zero,
        longModeBell3: Duration.zero,
        isDarkMode: true,
        showCongratsAnimation: true);
  }
  // Lightning or Long Session
  @HiveField(0)
  final TimerType sessionMode;

  // セッション時間
  @HiveField(1)
  final Duration sessionTime;

  // longMode時のセッション時間
  @HiveField(2)
  final Duration longSessionTime;

  // セッションを連続で行うか
  @HiveField(3)
  final bool isContinuous;

  // 連続セッション時のセッション間の休憩時間
  @HiveField(4)
  final Duration intervalTime;

  // ベル1 未設定の場合 Duration.zero
  @HiveField(5)
  final Duration bell1;

  // ベル2 未設定の場合 Duration.zero
  @HiveField(6)
  final Duration bell2;

  // ベル3 未設定の場合 Duration.zero
  @HiveField(7)
  final Duration bell3;

  // 長尺モード用ベル1 未設定の場合 Duration.zero
  @HiveField(8)
  final Duration longModeBell1;

  // 長尺モード用ベル2 未設定の場合 Duration.zero
  @HiveField(9)
  final Duration longModeBell2;

  // 長尺モード用ベル3 未設定の場合 Duration.zero
  @HiveField(10)
  final Duration longModeBell3;

  // ダークモード
  @HiveField(11)
  final bool isDarkMode;

  // セッション終了時アニメーションを表示するか
  @HiveField(12)
  final bool showCongratsAnimation;

  Settings copyWith({
    TimerType? sessionMode,
    Duration? sessionTime,
    Duration? longSessionTime,
    bool? isContinuous,
    Duration? intervalTime,
    Duration? bell1,
    Duration? bell2,
    Duration? bell3,
    Duration? longModeBell1,
    Duration? longModeBell2,
    Duration? longModeBell3,
    bool? isDarkMode,
    bool? showCongratsAnimation,
  }) {
    return Settings(
      sessionMode: sessionMode ?? this.sessionMode,
      sessionTime: sessionTime ?? this.sessionTime,
      longSessionTime: longSessionTime ?? this.longSessionTime,
      isContinuous: isContinuous ?? this.isContinuous,
      intervalTime: intervalTime ?? this.intervalTime,
      bell1: bell1 ?? this.bell1,
      bell2: bell2 ?? this.bell2,
      bell3: bell3 ?? this.bell3,
      longModeBell1: longModeBell1 ?? this.longModeBell1,
      longModeBell2: longModeBell2 ?? this.longModeBell2,
      longModeBell3: longModeBell3 ?? this.longModeBell3,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      showCongratsAnimation:
          showCongratsAnimation ?? this.showCongratsAnimation,
    );
  }
}
