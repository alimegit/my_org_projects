import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiamondArrowStrokePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();

    // Diamon oxirlarini yaratish
    path.moveTo(size.width / 2, 0); // tepadagi nuqta
    path.lineTo(size.width, size.height / 2); // o'ng tarafdagi nuqta
    path.lineTo(size.width / 2, size.height); // pastki nuqta
    path.lineTo(0, size.height / 2); // chap tarafdagi nuqta
    path.close(); // to'g'ri chiziqni yopish

    // Oxirlarni ekranga chizish
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}