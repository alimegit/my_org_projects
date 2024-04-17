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
  final isCorrect = false.obs;
  late List<String> shuffledLetters;
  Map<String, bool> letterAvailability = {};

  @override
  void onInit() {
    super.onInit();
    shuffleLetters();
  }

  void shuffleLetters() {
    String letters = 'abcdefghijklmnopqrstuvwxyz';
    shuffledLetters = currentAnswer.split('') + List.generate(12 - currentAnswer.length, (index) => letters[Random().nextInt(letters.length)]);
    shuffledLetters.shuffle();
    inputAnswer.value = "";
    errorMessage.value = "";
    letterAvailability = { for (var letter in shuffledLetters) letter: true };
    isCorrect.value = false;
  }

  String get currentQuestion => questions[currentIndex.value].question;
  String get currentAnswer => questions[currentIndex.value].answer;

  void addLetter(String letter) {
    if (inputAnswer.value.length < currentAnswer.length && letterAvailability[letter] == true) {
      inputAnswer.value += letter;
      letterAvailability[letter] = false;
      update();
      checkAnswer();
    }
  }

  void removeLastLetter() {
    if (inputAnswer.value.isNotEmpty) {
      var lastLetter = inputAnswer.value[inputAnswer.value.length - 1];
      inputAnswer.value = inputAnswer.value.substring(0, inputAnswer.value.length - 1);
      letterAvailability[lastLetter] = true;
      update();
      errorMessage.value = "";
    }
  }

  void checkAnswer() {
    if (inputAnswer.value == currentAnswer) {
      errorMessage.value = "To'g'ri!";
      isCorrect.value = true;
      nextQuestion();
    } else if (inputAnswer.value.length == currentAnswer.length) {
      errorMessage.value = "Xato javob";
      isCorrect.value = true;
      for (int i = 0; i < inputAnswer.value.length; i++) {
        letterAvailability[inputAnswer.value[i]] = true;
      }
      inputAnswer.value = "";
      update();
    }
  }

  void nextQuestion() async {
    await Future.delayed(Duration(seconds: 1));
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }
    shuffleLetters();
  }
}
