import 'dart:ui';

import 'package:flutter/material.dart';

class ByMove extends StatefulWidget {
  const ByMove({super.key});

  @override
  State<ByMove> createState() => _ByMoveState();
}

class _ByMoveState extends State<ByMove> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding:const  EdgeInsets.symmetric(),
          child: Column(
            children: [
              CustomPaint(
                size: const Size(double.infinity, 500),
                painter: MyPainter(),
              ),
            ],
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.deepOrangeAccent;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.3, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.8, size.width, size.height * 0.1);
    path.quadraticBezierTo(
        size.width * 0.2, size.height * 0.7, size.width, size.height * 0.1);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
