import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:animation_demo/sun_and_moon/sun_moon_painter.dart';
import 'package:flutter/material.dart';

class SunMoonAnimation extends StatefulWidget {
  final int time;
  final bool isPlaying;
  const SunMoonAnimation({super.key, required this.time, required this.isPlaying});

  @override
  _SunMoonAnimationState createState() => _SunMoonAnimationState();
}

class _SunMoonAnimationState extends State<SunMoonAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  ui.Image? sunImage;
  ui.Image? moonImage;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.time),
    );
    _animation = Tween<double>(begin: pi/2, end: pi/2 + 2 * pi).animate(_controller);

    _loadImages();
  }

  Future<void> _loadImages() async {
    final sun = await _loadImage('assets/sun.png');
    final moon = await _loadImage('assets/moon.png');
    setState(() {
      sunImage = sun;
      moonImage = moon;
    });
  }

  Future<ui.Image> _loadImage(String path) async {
    final image = await AssetImage(path).resolve(ImageConfiguration());
    final completer = Completer<ui.Image>();
    image.addListener(ImageStreamListener((info, _) {
      completer.complete(info.image);
    }));
    return completer.future;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              size: const Size(600, 600),
              painter: SunMoonPainter(_animation.value, sunImage, moonImage),
            );
          },
        ),
      );
  }

  @override
  void didUpdateWidget(covariant SunMoonAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
  }
}

