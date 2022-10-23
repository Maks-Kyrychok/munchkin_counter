import 'dart:math';

import 'package:flutter/material.dart';

class BottomBackgroundPainterWidget extends CustomPainter {
  final Color shapeColor;
  final List<Shadow> shadows;
  final Paint _paint;
  final Color bottomColor;

  BottomBackgroundPainterWidget(
      {required this.bottomColor,
      required this.shapeColor,
      required this.shadows})
      : _paint = Paint()
          ..color = shapeColor
          ..style = PaintingStyle.fill
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(
      0,
      size.width * 0.025,
      size.width * 0.3,
      0,
    );
    path.quadraticBezierTo(
      size.width * 0.5,
      size.width * 0.03,
      size.width * 0.72,
      0,
    );
    path.quadraticBezierTo(
      size.width,
      size.width * 0.027,
      size.width,
      0,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.width);

    path.close();

    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    for (var color in shadows) {
      canvas.save();
      canvas.translate(color.offset.dx, color.offset.dy);
      canvas.drawShadow(path, color.color, sqrt(color.blurRadius), true);
      canvas.restore();
    }
    canvas.drawPath(path, _paint);

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = bottomColor;
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
