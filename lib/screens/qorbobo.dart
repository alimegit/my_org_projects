import 'dart:math';

import 'package:flutter/material.dart';

class SnowDad extends StatefulWidget {
  const SnowDad({super.key});

  @override
  State<SnowDad> createState() => _SnowDadState();
}

class _SnowDadState extends State<SnowDad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.black,
          child: CustomPaint(
            size: Size(500, 500),
            painter: SnowDadPainter(),
          ),
        ),
      ),
    );
  }
}
class SnowDadPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height)/5;
    final center = Offset(200, 90);
    Offset center2 = Offset(200,90);
    var paint = Paint()..color = Colors.white;
    var paint2 = Paint()..color = Colors.white;
    var eye = Paint()..color = Colors.black;
    var eye1 = Paint()
      ..color = Colors.black
      ..strokeWidth= 5
      ..style = PaintingStyle.stroke
    ;
    final Paint nose = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    var hand = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 4.0;
    Path mouthPath = Path();
    mouthPath.moveTo(center2.dx - radius / 2, center2.dy + radius / 2);
    mouthPath.quadraticBezierTo(center2.dx, center2.dy + radius, center2.dx + radius / 2, center2.dy + radius / 2);
    canvas.drawPath(mouthPath, paint);

    canvas..drawCircle(center, radius, paint);
    canvas.drawCircle(Offset(200, 240),100,paint2);
    canvas.drawCircle(Offset(160, 60), 10, eye);
    canvas.drawCircle(Offset(230, 60), 10, eye);
    canvas.drawCircle(Offset(200, 250), 10, eye);
    canvas.drawCircle(Offset(200, 220), 10, eye);
    canvas.drawCircle(Offset(200, 280), 10, eye);
    canvas.drawCircle(Offset(200, 280), 10, eye);
    canvas.drawArc(
      Rect.fromCenter(center: Offset(200 , 110), width: 60, height: 50),
      0,
      pi,
      false,
      eye1,
    );
    canvas.drawOval(Rect.fromCircle(center: Offset(195, 80), radius: 20), nose);
    canvas.drawLine(Offset(20, 130), Offset(108.5, 210), hand);
    canvas.drawLine(Offset(390, 130), Offset(296, 210), hand);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}