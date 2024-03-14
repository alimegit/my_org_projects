import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  const Animation1({super.key});

  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> {
  bool isBigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isBigger = !isBigger;
            });
          },
          child: AnimatedContainer(
            width: isBigger ? 300 : 50,
            height: 50,
            duration: const Duration(seconds: 3),
            decoration: BoxDecoration(color: isBigger ? Colors.red : Colors.green),
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}
