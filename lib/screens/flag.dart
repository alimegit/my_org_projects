import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Flag extends StatefulWidget {
  const Flag({super.key});

  @override
  State<Flag> createState() => _FlagState();
}

class _FlagState extends State<Flag> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(     ),
        body: Center(
          child: Container(
            color: Colors.black,
            child: CustomPaint(
              size: Size(300, 200),
              painter: FlagPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class FlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 40;
    var paintRed = Paint()
      ..color = Colors.red
      ..strokeWidth = 40;
    var paintWhite = Paint()
      ..color = Colors.white
      ..strokeWidth = 40;
    var paintGreen = Paint()
      ..color = Colors.green
      ..strokeWidth = 40;
    var paintPoint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    var paintMoon = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round

      ..style = PaintingStyle.fill;
    Offset center = Offset(30,30 );
    double radius = size.width /15;
    Path path = Path()
      ..addArc(Rect.fromCircle(center: center, radius: radius), 7.7, pi/0.2);
      // ..lineTo(center.dx - radius, center.dy)
      // ..close();



    canvas.drawRect(Offset(0, 0) & Size(300,60), paint);
    canvas.drawRect(Offset(0, 60) & Size(300,10), paintRed);
    canvas.drawRect(Offset(0, 68) & Size(300,60), paintWhite);
    canvas.drawRect(Offset(0, 125) & Size(300,10), paintRed);
    canvas.drawRect(Offset(0, 135) & Size(300,65), paintGreen);
    canvas.drawPath(path, paintMoon);

    List<Offset> points = [
      Offset(70, 15),
      Offset(60, 15),
      Offset(80, 15),
      Offset(80, 25),
      Offset(70, 25),
      Offset(60, 25),
      Offset(50, 25),
      Offset(70, 35),
      Offset(60, 35),
      Offset(50, 35),
      Offset(40, 35),
      Offset(80, 35),
    ];
    for (var point in points) {
      canvas.drawPoints(PointMode.points, [point], paintPoint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>true;
  }



