import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';

import '../screen/puzzle/widgets/dialog.dart';

class PuzzleController extends GetxController {
  var gridSize = 4;
  RxList<int> tiles = List<int>.generate(16, (index) => index).obs;
  Timer? timer;
  final RxBool gameEnded = false.obs;
  final RxBool dialogShown = false.obs;
  final elapsedTime = '00:10'.obs; // O'yin uchun qolgan vaqt
  final moveCount = 0.obs; // Qancha harakat qilingan

  @override
  void onInit() {
    super.onInit();
    shuffleTiles();
    startTimer(); // Timer boshlash
  }

  void startTimer() {
    int totalSeconds = 10;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int currentSecond = totalSeconds - timer.tick;
      if (currentSecond <= 0) {
        gameEnded.value = true;
        checkEndGame();
        timer.cancel();
      } else {
        elapsedTime.value = formatTime(currentSecond);
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void checkEndGame() {
    if (gameEnded.value && !dialogShown.value) {
      dialogShown.value = true;
      Get.dialog(const EndGameDialog(), barrierDismissible: false);
    }
  }

  void resetGame() {
    shuffleTiles();
    gameEnded.value = false;
    dialogShown.value = false;
    moveCount.value = 0;
    timer?.cancel();
    startTimer();
  }
  void startGame() {
    resetGame(); // Mavjud reset funksiyasini chaqiradi o'yinni yangilash uchun
  }

  void moveTile(int index) {
    int zeroIndex = tiles.indexOf(0);  // 0 elementining indeksini topish
    if (zeroIndex == index) return;  // Agar bosilgan element 0 elementi bo'lsa, hech narsa qilmaymiz

    int row = index ~/ gridSize;  // Bosilgan elementning qatori
    int column = index % gridSize;  // Bosilgan elementning ustuni

    int zeroRow = zeroIndex ~/ gridSize;  // 0 elementining qatori
    int zeroColumn = zeroIndex % gridSize;  // 0 elementining ustuni

    // Faqat yonma-yon joylashgan elementlarni almashtirish
    if ((row == zeroRow && (column == zeroColumn + 1 || column == zeroColumn - 1)) ||
        (column == zeroColumn && (row == zeroRow + 1 || row == zeroRow - 1))) {
      tiles[zeroIndex] = tiles[index];
      tiles[index] = 0;
      tiles.refresh();  // UI yangilash

      moveCount.value++;  // Harakatlar sonini oshirish
    }
  }


  void shuffleTiles() {
    var random = Random();
    tiles.shuffle(random);
    tiles.refresh(); // Refresh the RxList to update UI
  }
}
