
import 'package:flutter/material.dart';

class Animation5 extends StatefulWidget {
  const Animation5({super.key});

  @override
  State<Animation5> createState() => _Animation5State();
}

class _Animation5State extends State<Animation5> with TickerProviderStateMixin {
  double right = 110;
  double left = 110;
  double bottom = 330;
  double top = 330;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          AnimatedPositioned(
            top: top,
            left: left,
            right: right,
            bottom: bottom,
            curve: Curves.linear,
            duration: const Duration(milliseconds: 300),
            child: Container(
              color: Colors.red,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          top = top - 20;
                          bottom = bottom + 20;
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.arrow_upward_outlined,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey,
                        child: InkWell(
                          onTap: () {
                            left = left - 20;
                            right = right + 20;
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey,
                        child: InkWell(
                          onTap: () {
                            right = right - 20;
                            left = left + 20;
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    child: InkWell(
                      onTap: () {
                        bottom = bottom - 20;
                        top = top + 20;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_downward,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
