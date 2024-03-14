import 'dart:math';

import 'package:flutter/material.dart';
class Smiles extends StatefulWidget {
  const Smiles({super.key});

  @override
  State<Smiles> createState() => _SmilesState();
}

class _SmilesState extends State<Smiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 40,),
              Container(
                child: Column(
                  children: [
                    CustomPaint(
                      size: const  Size(200, 200),
                      painter: BadSmilesPainter(),
                    ),
                    Text("Juda Yomon",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),)
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Container(
                child: Column(
                  children: [
                    CustomPaint(
                      size: const  Size(200, 200),
                      painter: HappySmilesPainter(),
                    ),
                    Text("Zo'r",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),)
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Container(
                child: Column(
                  children: [
                    CustomPaint(
                      size: const  Size(200, 200),
                      painter: AngrySmileyPainter(),
                    ),
                    Text("Yomon",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),)
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    CustomPaint(
                      size: const  Size(200, 200),
                      painter: SmileyPainter(),
                    ),
                    Text("Yomon",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class BadSmilesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var mouse = Paint()..color = Colors.red

    ;
    var eye = Paint()..color = Colors.red
      ..strokeWidth = 5
    ;
    var had = Paint()..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3
    ;

   canvas.drawCircle(Offset(200, 70), 50, had);
    canvas.drawArc(
      Rect.fromCenter(center: Offset(200 , 105), width: 30, height: 30),
      0,
      pi/-1,
      false,
      mouse,
    );
    canvas.drawArc(
      Rect.fromCenter(center: Offset(170 , 50), width: 30, height:30 ),
      0,
      pi/2,
      false,
      eye,
    );
    canvas.drawArc(
      Rect.fromCenter(center: Offset(210 , 65), width: 30, height:30 ),
      0,
      pi/-2,
      false,
      eye,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
class HappySmilesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var mouse = Paint()..color = Colors.orangeAccent

    ;
    var eye = Paint()..color = Colors.orangeAccent
      ..strokeWidth = 5
    ;
    var had = Paint()..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
    ;

    canvas.drawCircle(Offset(200, 70), 50, had);
    canvas.drawArc(
      Rect.fromCenter(center: Offset(200 , 90), width: 50, height: 20),
      0,
      pi,
      false,
      mouse,
    );
    canvas.drawArc(
      Rect.fromCenter(center: Offset(170 , 65), width: 30, height:30 ),
      0,
      pi/-2,
      false,
      eye,
    );
    canvas.drawArc(
      Rect.fromCenter(center: Offset(210 , 65), width: 30, height:30 ),
      0,
      pi/-2,
      false,
      eye,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
class AngrySmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.yellow
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 3;
    canvas.drawCircle(center, radius, paint);
    paint.color = Colors.black;
    Offset eyeLeft = Offset(center.dx - radius / 2, center.dy - radius / 3);
    Offset eyeRight = Offset(center.dx + radius / 2, center.dy - radius / 3);
    canvas.drawCircle(eyeLeft, radius / 10, paint);
    canvas.drawCircle(eyeRight, radius / 10, paint);
    paint.color = Colors.black;
    Path mouthPath = Path();
    mouthPath.moveTo(center.dx - radius / 2, center.dy + radius / 3);
    mouthPath.lineTo(center.dx + radius / 2, center.dy + radius / 3);
    canvas.drawPath(mouthPath, paint);
    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    canvas.drawLine(Offset(center.dx - radius / 2, center.dy - radius / 2),
        Offset(center.dx + radius / 2, center.dy + radius / 2), linePaint);
    canvas.drawLine(Offset(center.dx + radius / 2, center.dy - radius / 2),
        Offset(center.dx - radius / 2, center.dy + radius / 2), linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    // Bu sizning smileyning yuqori yarimini yaratish uchun
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    // Eyelashes
    Paint eyelashPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.35), 4.0, eyelashPaint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.35), 4.0, eyelashPaint);

    // Eyes
    paint.color = Colors.white;
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.35), 12.0, paint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.35), 12.0, paint);

    // Pupils
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.35), 6.0, eyelashPaint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.35), 6.0, eyelashPaint);

    // Mouth
    Path path = Path();
    path.moveTo(size.width * 0.3, size.height * 0.65);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.8, size.width * 0.7, size.height * 0.65);
    canvas.drawPath(path, eyelashPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Smiley Example')),
      body: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: SmileyPainter(),
        ),
      ),
    ),
  ));
}
