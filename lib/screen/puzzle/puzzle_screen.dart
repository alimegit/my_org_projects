import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx/puzzle_controller.dart';

class PuzzleView extends StatelessWidget {
  const PuzzleView({super.key});

  @override
  Widget build(BuildContext context) {
    final PuzzleController controller = Get.put(PuzzleController()); // Ensure controller is correctly instantiated

    return Scaffold(
      appBar: AppBar(
        title: const Text('15 Puzzle'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => Text(
                  'Time: ${controller.elapsedTime.value}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                Obx(() => Text(
                  'Moves: ${controller.moveCount.value}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.deepPurple[300]!, Colors.deepPurple[100]!],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Obx(() {
                    return GridView.builder(
                      itemCount: controller.tiles.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: controller.gridSize,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4),
                      itemBuilder: (context, index) {
                        if (controller.tiles[index] == 0) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              if (!controller.gameEnded.value) {
                                controller.moveTile(index);
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[400],
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                controller.tiles[index].toString(),
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(fontSize: 24),
              ),
              onPressed: () {
                if (controller.gameEnded.value && !controller.dialogShown.value) {
                  controller.dialogShown.value = true;
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Game Over'),
                      content: const Text('Would you like to start a new game?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            controller.startGame();
                          },
                          child: const Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('No'),
                        ),
                      ],
                    ),
                  );
                } else {
                  controller.startGame();
                }
              },
              child: const Text('Start Game'),
            ),
          ),
        ],
      ),
    );
  }
}
