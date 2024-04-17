import 'package:get/get.dart';
import 'dart:math';

import '../../../data/models/questions.dart';

class GameController extends GetxController {
  final questions = <Question>[
    Question(question: "Bu meva qizil, shirin va yozda yetishtiriladi", answer: "olma"),
    Question(question: "Qishning sovg'asi", answer: "qor"),
    Question(question: "Kunduzi yorqin, tunda ko'rinmaydi", answer: "quyosh"),
    Question(question: "Uchadi lekin qush emas", answer: "samolyot"),
    Question(question: "Suv ostida yashaydi, nafas olmaydi", answer: "baliq"),
    Question(question: "Har kuni ko'rasiz, lekin ushlolmaysiz", answer: "havo"),
    Question(question: "Sariq va dumaloq, hammaga yoqadi", answer: "banan"),
    Question(question: "Qishda issiq, yozda sovuq", answer: "choy"),
    Question(question: "Qog'ozdan yasalgan va osmonda uchadi", answer: "qog'oz uchoq"),
    Question(question: "Oltin emas, lekin qimmat", answer: "vaqt"),
  ].obs;
  final currentIndex = 0.obs;
  final inputAnswer = "".obs;
  final errorMessage = "".obs;
  late List<String> shuffledLetters;

  @override
  void onInit() {
    super.onInit();
    shuffleLetters();
  }

  void shuffleLetters() {
    shuffledLetters = currentAnswer.split('')..shuffle();
    inputAnswer.value = "";
    errorMessage.value = "";
  }

  String get currentQuestion => questions[currentIndex.value].question;
  String get currentAnswer => questions[currentIndex.value].answer;

  void addLetter(String letter) {
    if (inputAnswer.value.length < currentAnswer.length) {
      inputAnswer.value += letter;
      checkAnswer();
    }
  }

  void removeLastLetter() {
    if (inputAnswer.value.isNotEmpty) {
      inputAnswer.value = inputAnswer.value.substring(0, inputAnswer.value.length - 1);
      errorMessage.value = "";
    }
  }

  void checkAnswer() {
    if (inputAnswer.value == currentAnswer) {
      errorMessage.value = "To'g'ri!";
      nextQuestion();
    } else if (inputAnswer.value.length == currentAnswer.length) {
      errorMessage.value = "Xato javob";
    }
  }

  void nextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      shuffleLetters();
    } else {
      currentIndex.value = 0; // Restart the game
      shuffleLetters();
    }
  }
}
