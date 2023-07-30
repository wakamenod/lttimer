import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lttimer/src/screens/settings_controller.dart';

class DanmakuLayer extends ConsumerStatefulWidget {
  const DanmakuLayer({super.key});

  @override
  ConsumerState<DanmakuLayer> createState() => _DanmakuLayerState();
}

class _DanmakuLayerState extends ConsumerState<DanmakuLayer> {
  List<Widget> danmakuList = [];

  void startDanmaku() {
    final text = ref.read(settingsControllerProvider).congratsDanmakuComments;
    for (var i = 0; i < 8; i++) {
      Timer(Duration(seconds: i), () {
        setState(() {
          danmakuList.add(_createDanmaku(text));
        });
      });
    }
  }

  Widget _createDanmaku(String text) {
    double topPosition = Random().nextDouble() * 350;
    double fontSize = 14 + Random().nextDouble() * 10;

    return Positioned(
      top: topPosition,
      right: 0,
      child: MovingText(
        text: text,
        fontSize: fontSize,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startDanmaku();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: danmakuList);
  }
}

class MovingText extends StatefulWidget {
  final String text;
  final double fontSize;

  const MovingText({super.key, required this.text, required this.fontSize});

  @override
  State<MovingText> createState() => _MovingTextState();
}

class _MovingTextState extends State<MovingText>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..forward();

    offset = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(-5, 0),
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offset,
      child: Text(
        widget.text,
        style: TextStyle(fontSize: widget.fontSize),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
