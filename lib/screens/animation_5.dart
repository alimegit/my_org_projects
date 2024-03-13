
import 'package:flutter/material.dart';

class Animation5 extends StatefulWidget {
  const Animation5({super.key});

  @override
  State<Animation5> createState() => _Animation5State();
}

class _Animation5State extends State<Animation5> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation topPad;
  late Animation leftPad;
  late Animation bottomPad;
  late Animation rightPad;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    topPad = Tween<double>(begin: 10.0, end: 100.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.bounceIn,
    ));
    bottomPad = Tween<double>(begin: 10.0, end: 100.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
      reverseCurve: Curves.easeIn,
    ));
    leftPad = Tween<double>(begin: 10.0, end: 100.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
      reverseCurve: Curves.easeIn,
    ));
    rightPad = Tween<double>(begin: 10.0, end: 100.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeIn,
    ))

    ..addListener(() { });
    animationController.addListener(() { });
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(bottom: bottomPad.value,top: topPad.value,right: rightPad.value,left: leftPad.value),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: (){
                setState(() {
                 topPad;
                });
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(color: Colors.grey),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("^", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
setState(() {
  leftPad;
});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("<",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      bottomPad;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("▽",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      rightPad;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ">",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
