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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    painter: BadSmilesPainter(),
                  ),
                  Text("Yomon",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),)
                ],
              ),
            ),
          ],
        ),
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
class SadSmilePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
