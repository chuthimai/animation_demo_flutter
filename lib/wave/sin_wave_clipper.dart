import 'dart:math';

import 'package:flutter/cupertino.dart';

class SinWaveClipper extends CustomClipper<Path> {
  final double waveAmplitude;
  final double lambda;
  final double alpha0;
  final double heightPart;


  SinWaveClipper({
    required this.waveAmplitude,
    required this.lambda,
    required this.alpha0,
    required this.heightPart
  });

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);

    for (double x = 0; x <= size.width; x++) {
      double y = waveAmplitude * sin((2 * pi / lambda) * x + alpha0);
      path.lineTo(x, size.height * heightPart + y);
    }

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}