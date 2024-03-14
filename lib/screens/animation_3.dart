import 'package:flutter/material.dart';

class Animation3 extends StatefulWidget {
  const Animation3({super.key});

  @override
  State<Animation3> createState() => _Animation3State();
}

class _Animation3State extends State<Animation3> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 10, end: 50).animate(
      CurvedAnimation(
          parent: animationController, curve: Curves.linear, reverseCurve: Curves.linear),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        animationController.repeat(reverse: true);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: (){
            animationController.repeat(reverse: true);
          },
          child:   Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(color: Colors.orange),
                        ), Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(color: Colors.red),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(color: Colors.blue),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
