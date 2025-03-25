import 'dart:math';

import 'package:animation_demo/wave/sin_wave_clipper.dart';
import 'package:flutter/material.dart';

class WaveAnimation extends StatefulWidget {
  final double waveAmplitude;
  final double lambda;
  final double alpha0;
  final double heightPart;
  final int timeControllerAlpha;
  final int timeControllerAmplitude;
  final Color color;

  const WaveAnimation({super.key,
    required this.waveAmplitude,
    required this.lambda,
    required this.alpha0,
    required this.heightPart,
    required this.timeControllerAlpha,
    required this.timeControllerAmplitude,
    this.color = Colors.cyan,
  });

  @override
  State<WaveAnimation> createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controllerAlpha;
  late AnimationController _controllerAmplitude;

  late Animation<double> _animationAlpha;
  late Animation<double> _animationAmplitude;

  @override
  void initState() {
    super.initState();
    _controllerAlpha = AnimationController(
      duration: Duration(seconds: widget.timeControllerAlpha),
      vsync: this,
    )..repeat();

    _controllerAmplitude = AnimationController(
      duration: Duration(seconds: widget.timeControllerAmplitude),
      vsync: this,
    )..repeat(reverse: true);

    _animationAlpha =
        Tween<double>(begin: 0, end: 2 * pi).animate(_controllerAlpha);
    _animationAmplitude =
        Tween<double>(begin: -widget.waveAmplitude, end: widget.waveAmplitude)
            .animate(_controllerAmplitude);
  }

  @override
  void dispose() {
    _controllerAlpha.dispose();
    _controllerAmplitude.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return AnimatedBuilder(
        animation: _animationAmplitude,
        builder: (context, child) {
          return AnimatedBuilder(
              animation: _animationAlpha,
              builder: (context, child) {
                return ClipPath(
                  clipper: SinWaveClipper(
                    waveAmplitude: _animationAmplitude.value,
                    lambda: widget.lambda,
                    alpha0: 0 + _animationAlpha.value,
                    heightPart: widget.heightPart,
                  ),
                  child: Container(
                    color: widget.color,
                    width: width,
                    height: height,
                  ),
                );
              });
        });
  }
}
