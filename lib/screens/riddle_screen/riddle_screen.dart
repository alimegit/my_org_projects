import 'package:default_project/screens/riddle_screen/view/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/images/app_images.dart';

class RiddleScreen extends StatelessWidget {
  const RiddleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.put(GameController());

    return Scaffold(
      appBar: AppBar(title: const Text('Guess the Word')),
      body: Obx(() {
        return Stack(
          children: [
            Image.asset(AppImages.riddle, width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 300),
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
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: 36,
                              height: 48,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(controller.inputAnswer.value.length > index ? controller.inputAnswer.value[index] : "", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: controller.inputAnswer.value.length > index ? Colors.black : Colors.grey)),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 8,
                        children: controller.shuffledLetters.map((letter) => ElevatedButton(
                          onPressed: () => controller.addLetter(letter),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                          child: Text(letter, style: const TextStyle(fontSize: 24)),
                        )).toList(),
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
