import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lttimer/i18n/translations.g.dart';
import 'package:lttimer/src/screens/timer_controller.dart';

class MessageText extends ConsumerWidget {
  final double radius;

  const MessageText({required this.radius, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInterval =
        ref.watch(timerControllerProvider.select((value) => value.isInterval));
    final showAnimation = ref
        .watch(timerControllerProvider.select((value) => value.showAnimation));
    final startFinalCountdown = ref.watch(
        timerControllerProvider.select((value) => value.startFinalCountdown));

    return SizedBox(
        width: radius * 2,
        child: Center(
            child: showAnimation
                ? Transform.translate(
                    offset: Offset(0, -radius * 0.02),
                    child: Text(
                      t.timer.congrats,
                      style: GoogleFonts.zenKakuGothicNew(
                          fontWeight: FontWeight.bold,
                          fontSize: radius / 8,
                          color: Colors.green),
                    ),
                  )
                : isInterval
                    ? Transform.translate(
                        offset: Offset(0, -radius * 0.2),
                        child: _BlinkingText(
                          t.timer.intervalText,
                          style: GoogleFonts.zenKakuGothicNew(
                              fontSize: radius / 7, color: Colors.pink),
                        ),
                      )
                    : startFinalCountdown
                        ? Transform.translate(
                            offset: Offset(0, -radius * 0.01),
                            child: _CountdownAnimation(
                              radius: radius,
                            ))
                        : Transform.translate(
                            offset: Offset(0, -radius * 0.15),
                            child: Text(
                              t.timer.timeLeft,
                              style: GoogleFonts.zenKakuGothicNew(
                                  fontSize: radius / 8),
                            ),
                          )));
  }
}

class _BlinkingText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const _BlinkingText(this.text, {required this.style});

  @override
  _BlinkingTextState createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<_BlinkingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animationController.repeat(reverse: true);
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _animationController.value,
          child: Text(
            widget.text,
            style: widget.style,
          ),
        );
      },
    );
  }
}

class _CountdownAnimation extends StatefulWidget {
  const _CountdownAnimation({required this.radius});

  final double radius;

  @override
  _CountdownAnimationState createState() => _CountdownAnimationState();
}

class _CountdownAnimationState extends State<_CountdownAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late int _counter;

  @override
  void initState() {
    super.initState();

    _counter = 5;

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (_counter > 0) {
            _counter--;
            _controller.reset();
            _controller.forward();
          }
        }
      });

    _animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double opacity = 1.0 - _animation.value;
    double scale = 1.0 + (1.0 - _animation.value);

    double fontSize = widget.radius / 3;
    double timesUpFontSize = widget.radius / 10;

    return Transform.scale(
      scale: scale,
      child: Opacity(
        opacity: opacity,
        child: Text(
          _counter == 0 ? "Time's up!" : '$_counter',
          style:
              TextStyle(fontSize: _counter == 0 ? timesUpFontSize : fontSize),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
