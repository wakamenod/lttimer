// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Timer {
// 経過時間
// NOTE SingleTickerProviderStateMixinではtickerをstopすると渡される
//      経過時間が0に戻るので、stop前の経過時間を足して扱う(_elapsed参照)
  Duration get currentElapsed => throw _privateConstructorUsedError;
  Duration get prevElapsed => throw _privateConstructorUsedError; // タイマーで計測する時間
  Duration get timerDuration => throw _privateConstructorUsedError; // タイマー起動中か
  bool get isRunning => throw _privateConstructorUsedError; // 最後のカウントダウンを開始したか
  bool get startFinalCountdown =>
      throw _privateConstructorUsedError; // 連続セッションでのインターバル中か
  bool get isInterval => throw _privateConstructorUsedError; // アニメーションを表示するか
  bool get showAnimation => throw _privateConstructorUsedError; // リセット状態か
  bool get isReset => throw _privateConstructorUsedError; // ベルの音を管理するキュー
  Queue<Duration> get bellsQueue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerCopyWith<Timer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerCopyWith<$Res> {
  factory $TimerCopyWith(Timer value, $Res Function(Timer) then) =
      _$TimerCopyWithImpl<$Res, Timer>;
  @useResult
  $Res call(
      {Duration currentElapsed,
      Duration prevElapsed,
      Duration timerDuration,
      bool isRunning,
      bool startFinalCountdown,
      bool isInterval,
      bool showAnimation,
      bool isReset,
      Queue<Duration> bellsQueue});
}

/// @nodoc
class _$TimerCopyWithImpl<$Res, $Val extends Timer>
    implements $TimerCopyWith<$Res> {
  _$TimerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentElapsed = null,
    Object? prevElapsed = null,
    Object? timerDuration = null,
    Object? isRunning = null,
    Object? startFinalCountdown = null,
    Object? isInterval = null,
    Object? showAnimation = null,
    Object? isReset = null,
    Object? bellsQueue = null,
  }) {
    return _then(_value.copyWith(
      currentElapsed: null == currentElapsed
          ? _value.currentElapsed
          : currentElapsed // ignore: cast_nullable_to_non_nullable
              as Duration,
      prevElapsed: null == prevElapsed
          ? _value.prevElapsed
          : prevElapsed // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerDuration: null == timerDuration
          ? _value.timerDuration
          : timerDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      startFinalCountdown: null == startFinalCountdown
          ? _value.startFinalCountdown
          : startFinalCountdown // ignore: cast_nullable_to_non_nullable
              as bool,
      isInterval: null == isInterval
          ? _value.isInterval
          : isInterval // ignore: cast_nullable_to_non_nullable
              as bool,
      showAnimation: null == showAnimation
          ? _value.showAnimation
          : showAnimation // ignore: cast_nullable_to_non_nullable
              as bool,
      isReset: null == isReset
          ? _value.isReset
          : isReset // ignore: cast_nullable_to_non_nullable
              as bool,
      bellsQueue: null == bellsQueue
          ? _value.bellsQueue
          : bellsQueue // ignore: cast_nullable_to_non_nullable
              as Queue<Duration>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerCopyWith<$Res> implements $TimerCopyWith<$Res> {
  factory _$$_TimerCopyWith(_$_Timer value, $Res Function(_$_Timer) then) =
      __$$_TimerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration currentElapsed,
      Duration prevElapsed,
      Duration timerDuration,
      bool isRunning,
      bool startFinalCountdown,
      bool isInterval,
      bool showAnimation,
      bool isReset,
      Queue<Duration> bellsQueue});
}

/// @nodoc
class __$$_TimerCopyWithImpl<$Res> extends _$TimerCopyWithImpl<$Res, _$_Timer>
    implements _$$_TimerCopyWith<$Res> {
  __$$_TimerCopyWithImpl(_$_Timer _value, $Res Function(_$_Timer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentElapsed = null,
    Object? prevElapsed = null,
    Object? timerDuration = null,
    Object? isRunning = null,
    Object? startFinalCountdown = null,
    Object? isInterval = null,
    Object? showAnimation = null,
    Object? isReset = null,
    Object? bellsQueue = null,
  }) {
    return _then(_$_Timer(
      currentElapsed: null == currentElapsed
          ? _value.currentElapsed
          : currentElapsed // ignore: cast_nullable_to_non_nullable
              as Duration,
      prevElapsed: null == prevElapsed
          ? _value.prevElapsed
          : prevElapsed // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerDuration: null == timerDuration
          ? _value.timerDuration
          : timerDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      startFinalCountdown: null == startFinalCountdown
          ? _value.startFinalCountdown
          : startFinalCountdown // ignore: cast_nullable_to_non_nullable
              as bool,
      isInterval: null == isInterval
          ? _value.isInterval
          : isInterval // ignore: cast_nullable_to_non_nullable
              as bool,
      showAnimation: null == showAnimation
          ? _value.showAnimation
          : showAnimation // ignore: cast_nullable_to_non_nullable
              as bool,
      isReset: null == isReset
          ? _value.isReset
          : isReset // ignore: cast_nullable_to_non_nullable
              as bool,
      bellsQueue: null == bellsQueue
          ? _value.bellsQueue
          : bellsQueue // ignore: cast_nullable_to_non_nullable
              as Queue<Duration>,
    ));
  }
}

/// @nodoc

class _$_Timer extends _Timer {
  const _$_Timer(
      {required this.currentElapsed,
      required this.prevElapsed,
      required this.timerDuration,
      required this.isRunning,
      required this.startFinalCountdown,
      required this.isInterval,
      required this.showAnimation,
      required this.isReset,
      required this.bellsQueue})
      : super._();

// 経過時間
// NOTE SingleTickerProviderStateMixinではtickerをstopすると渡される
//      経過時間が0に戻るので、stop前の経過時間を足して扱う(_elapsed参照)
  @override
  final Duration currentElapsed;
  @override
  final Duration prevElapsed;
// タイマーで計測する時間
  @override
  final Duration timerDuration;
// タイマー起動中か
  @override
  final bool isRunning;
// 最後のカウントダウンを開始したか
  @override
  final bool startFinalCountdown;
// 連続セッションでのインターバル中か
  @override
  final bool isInterval;
// アニメーションを表示するか
  @override
  final bool showAnimation;
// リセット状態か
  @override
  final bool isReset;
// ベルの音を管理するキュー
  @override
  final Queue<Duration> bellsQueue;

  @override
  String toString() {
    return 'Timer(currentElapsed: $currentElapsed, prevElapsed: $prevElapsed, timerDuration: $timerDuration, isRunning: $isRunning, startFinalCountdown: $startFinalCountdown, isInterval: $isInterval, showAnimation: $showAnimation, isReset: $isReset, bellsQueue: $bellsQueue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Timer &&
            (identical(other.currentElapsed, currentElapsed) ||
                other.currentElapsed == currentElapsed) &&
            (identical(other.prevElapsed, prevElapsed) ||
                other.prevElapsed == prevElapsed) &&
            (identical(other.timerDuration, timerDuration) ||
                other.timerDuration == timerDuration) &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning) &&
            (identical(other.startFinalCountdown, startFinalCountdown) ||
                other.startFinalCountdown == startFinalCountdown) &&
            (identical(other.isInterval, isInterval) ||
                other.isInterval == isInterval) &&
            (identical(other.showAnimation, showAnimation) ||
                other.showAnimation == showAnimation) &&
            (identical(other.isReset, isReset) || other.isReset == isReset) &&
            const DeepCollectionEquality()
                .equals(other.bellsQueue, bellsQueue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentElapsed,
      prevElapsed,
      timerDuration,
      isRunning,
      startFinalCountdown,
      isInterval,
      showAnimation,
      isReset,
      const DeepCollectionEquality().hash(bellsQueue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerCopyWith<_$_Timer> get copyWith =>
      __$$_TimerCopyWithImpl<_$_Timer>(this, _$identity);
}

abstract class _Timer extends Timer {
  const factory _Timer(
      {required final Duration currentElapsed,
      required final Duration prevElapsed,
      required final Duration timerDuration,
      required final bool isRunning,
      required final bool startFinalCountdown,
      required final bool isInterval,
      required final bool showAnimation,
      required final bool isReset,
      required final Queue<Duration> bellsQueue}) = _$_Timer;
  const _Timer._() : super._();

  @override // 経過時間
// NOTE SingleTickerProviderStateMixinではtickerをstopすると渡される
//      経過時間が0に戻るので、stop前の経過時間を足して扱う(_elapsed参照)
  Duration get currentElapsed;
  @override
  Duration get prevElapsed;
  @override // タイマーで計測する時間
  Duration get timerDuration;
  @override // タイマー起動中か
  bool get isRunning;
  @override // 最後のカウントダウンを開始したか
  bool get startFinalCountdown;
  @override // 連続セッションでのインターバル中か
  bool get isInterval;
  @override // アニメーションを表示するか
  bool get showAnimation;
  @override // リセット状態か
  bool get isReset;
  @override // ベルの音を管理するキュー
  Queue<Duration> get bellsQueue;
  @override
  @JsonKey(ignore: true)
  _$$_TimerCopyWith<_$_Timer> get copyWith =>
      throw _privateConstructorUsedError;
}
