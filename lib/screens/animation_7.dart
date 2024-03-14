import 'package:flutter/material.dart';

class Animation7 extends StatefulWidget {
  const Animation7({super.key});

  @override
  State<Animation7> createState() => _Animation7State();
}

class _Animation7State extends State<Animation7> with TickerProviderStateMixin{
  bool isContainer = false;
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isContainer = !isContainer;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: AnimatedContainer(
              height: isContainer ? 500 : 50,
              decoration: BoxDecoration(
                color: isContainer ? Colors.red : Colors.green,
              ),
              duration: Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );
  }
}
