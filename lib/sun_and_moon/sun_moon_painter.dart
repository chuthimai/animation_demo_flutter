import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class SunMoonPainter extends CustomPainter {
  final double progress;
  final ui.Image? sunImage;
  final ui.Image? moonImage;

  SunMoonPainter(this.progress, this.sunImage, this.moonImage);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;

    // Tính toán vị trí
    double moonAngle = progress;
    double sunAngle = moonAngle + pi;

    Offset sunPosition = center + Offset(cos(sunAngle) * radius, sin(sunAngle) * radius);
    Offset moonPosition = center + Offset(cos(moonAngle) * radius, sin(moonAngle) * radius);

    // Vẽ hình ảnh
    if (sunImage != null) {
      _drawImage(canvas, sunImage!, sunPosition, size.width / 4);
    }
    if (moonImage != null) {
      _drawImage(canvas, moonImage!, moonPosition, size.width / 5);
    }
  }

  void _drawImage(Canvas canvas, ui.Image image, Offset position, double size) {
    final rect = Rect.fromCenter(center: position, width: size, height: size);
    paintImage(canvas: canvas, rect: rect, image: image, fit: BoxFit.cover);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
