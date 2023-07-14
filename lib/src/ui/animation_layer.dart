import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLayer extends StatefulWidget {
  final double width;
  final double height;

  const AnimationLayer({required this.width, required this.height, super.key});

  @override
  State<AnimationLayer> createState() => _AnimationLayerState();
}

class _AnimationLayerState extends State<AnimationLayer>
    with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 2500))
    ..repeat(reverse: true);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clapSize = widget.width / 4;
    final tadaSize = widget.width / 2;
    final partyPopperSize = widget.width / 3;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          _LottieAnimatedWidget(
              animation: _animationController,
              begin: 0.1,
              end: 0.1,
              left: clapSize,
              bottom: clapSize,
              size: clapSize,
              type: _AnimationType.clapping),
          _LottieAnimatedWidget(
              animation: _animationController,
              begin: 0.1,
              end: 0.5,
              left: clapSize * 1.2,
              bottom: clapSize * 2,
              size: clapSize,
              type: _AnimationType.clapping),
          _LottieAnimatedWidget(
              animation: _animationController,
              begin: 0.2,
              end: 0.3,
              left: partyPopperSize * 0.05,
              bottom: partyPopperSize * 0.7,
              size: tadaSize,
              type: _AnimationType.partyPopper),
          _LottieAnimatedWidget(
              animation: _animationController,
              begin: 0.2,
              end: 0.35,
              left: clapSize * 0.3,
              bottom: clapSize * 2,
              size: clapSize,
              type: _AnimationType.clapping),
          _LottieAnimatedWidget(
              animation: _animationController,
              begin: 0.1,
              end: 0.5,
              left: clapSize * 2.8,
              bottom: clapSize,
              size: clapSize,
              flip: true,
              type: _AnimationType.clapping),
          _LottieAnimatedWidget(
              animation: _animationController,
              begin: 0.15,
              end: 0.25,
              left: clapSize * 2,
              bottom: clapSize * 1.5,
              size: clapSize,
              flip: true,
              type: _AnimationType.clapping),
          _LottieAnimatedWidget(
              animation: _animationController,
              begin: 0.2,
              end: 0.35,
              left: clapSize * 2.3,
              bottom: clapSize * 2,
              size: clapSize,
              flip: true,
              type: _AnimationType.clapping),
          _LottieAnimatedWidget(
              animation: _animationController,
              begin: 0,
              end: 1,
              left: tadaSize,
              bottom: tadaSize,
              size: tadaSize,
              type: _AnimationType.tada),
          _LottieAnimatedWidget(
              animation: _animationController,
              begin: 0,
              end: 1,
              left: tadaSize * 0.2,
              bottom: tadaSize * 1.2,
              size: tadaSize,
              type: _AnimationType.tada),
          _LottieAnimatedWidget(
              animation: _animationController,
              begin: 0.3,
              end: 0.4,
              left: partyPopperSize * 1.8,
              bottom: partyPopperSize * 0.9,
              size: tadaSize,
              flip: true,
              type: _AnimationType.partyPopper),
        ],
      ),
    );
  }
}

enum _AnimationType {
  clapping(asset: 'assets/clapping.json'),
  partyPopper(asset: 'assets/party_popper.json'),
  tada(asset: 'assets/tada.json');

  const _AnimationType({required this.asset});

  final String asset;
}

class _LottieAnimatedWidget extends AnimatedWidget {
  _LottieAnimatedWidget({
    required Animation<double> animation,
    required this.begin,
    required this.end,
    required this.left,
    required this.bottom,
    required this.size,
    required this.type,
    this.curve = Curves.linear,
    this.flip = false,
  })  : opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animation, curve: Interval(begin, end, curve: curve))),
        super(listenable: animation);

  final double begin;
  final double end;
  final Curve curve;

  final Animation<double> opacityAnimation;
  final bool flip;
  final double size;
  final double left;
  final double bottom;
  final _AnimationType type;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: bottom,
      child: Opacity(
        opacity: opacityAnimation.value,
        child: Transform(
          transform: Matrix4.identity()..scale(flip ? -1.0 : 1.0, 1.0),
          alignment: Alignment.center,
          child: SizedBox(
              width: size,
              height: size,
              child: FittedBox(child: Lottie.asset(type.asset))),
        ),
      ),
    );
  }
}
