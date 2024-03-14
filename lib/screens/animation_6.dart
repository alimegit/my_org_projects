

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animation6 extends StatefulWidget {
  const Animation6({super.key});

  @override
  State<Animation6> createState() => _Animation6State();
}

class _Animation6State extends State<Animation6> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation <double>textAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    textAnimation = Tween<double>(begin: 12.0, end: 50.0).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Expanded(
                child: Text(
                  "Lorem hbrhvcbwuxbgcvhgbusbefvdgywqbgsyugbecvwyghsgbuyvfgedvwybshnjoaegvdfgevrcfercfhervfcgecgfvecfebdbfhcjebvdchyuekqwdcyekwvfgjercvgyfvwfykvfvgwjersv ckebwcucgewvcgvwecvcrwk",
                  style: TextStyle(fontSize: textAnimation.value),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    controller.repeat(reverse: true);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("Big Size"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
