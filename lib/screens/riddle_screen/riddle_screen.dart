import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:default_project/screens/riddle_screen/view/question_controller.dart'; // Import yo'lini to'g'rilang!
import '../../utils/images/app_images.dart';

class RiddleScreen extends StatefulWidget {
  const RiddleScreen({super.key});

  @override
  State<RiddleScreen> createState() => _RiddleScreenState();
}

class _RiddleScreenState extends State<RiddleScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds:1),
      vsync: this,
    );
    _colorAnimation = ColorTween(begin: Colors.white.withOpacity(0.5), end: Colors.white.withOpacity(0.5)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.put(GameController());

    return Scaffold(
      appBar: AppBar(title: const Text('Guess the Word')),
      body: Obx(() {
        if (controller.isCorrect.value) {
          _controller.reverse();
        } else {
          _controller.forward();
        }

        return Stack(
          children: [
            Image.asset(AppImages.riddle, width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(controller.currentQuestion, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                      ),
                      Wrap(
                        children: List.generate(controller.currentAnswer.length, (index) {
                          return Container(
                            width: 36,
                            height: 48,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                            decoration: BoxDecoration(
                              color: controller.isCorrect.value ? Colors.white.withOpacity(0.5) : Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(controller.inputAnswer.value.length > index ? controller.inputAnswer.value[index] : "", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black)),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 8,
                        children: controller.letterAvailability.entries
                            .where((entry) => entry.value)
                            .map((entry) {
                          return ElevatedButton(
                            onPressed: () => controller.addLetter(entry.key),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            child: Text(entry.key, style: const TextStyle(fontSize: 24)),
                          );
                        }).toList(),
                      ),
                      ElevatedButton(
                        onPressed: () => controller.removeLastLetter(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        child: const Text("Orqaga", style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(height: 20),

                      Text(controller.errorMessage.value, style: const TextStyle(color: Colors.red, fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
