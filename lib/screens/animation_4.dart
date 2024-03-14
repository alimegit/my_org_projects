import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animation4 extends StatefulWidget {
  const Animation4({super.key});

  @override
  State<Animation4> createState() => _Animation4State();
}

class _Animation4State extends State<Animation4> {
  bool isBorder = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: (){
            setState(() {
              isBorder = !isBorder;
            });
          },
          child: Stack(
            children: [
              Center(
                child: Positioned(
                  child: AnimatedContainer(
              width: isBorder? 100:100,
              height: isBorder? 100:100,
                    duration: const Duration(seconds: 2),
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              Center(
                child: AnimatedContainer(
                  width: isBorder? 200:100,
                  height: isBorder? 200:100,
                  duration: const Duration(seconds: 2),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black,width: 2)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
