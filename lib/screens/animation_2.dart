import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  const Animation2({super.key});

  @override
  State<Animation2> createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> {
  bool isOpacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isOpacity = !isOpacity;
            });
          },
          child: AnimatedContainer(
            height: 150,
            width: 150,
            duration: Duration(seconds: 3),
            decoration:
                /// ekranni o'rtasiga bosing mo'jiza ro'y beradi☺
                BoxDecoration(color: isOpacity ? Colors.white : Colors.green.withOpacity(0.01)),
          ),
        ),
      ),
    );
  }
}
