import 'package:get/get.dart';
import 'package:quiz_app/model/quizmodel.dart';
import 'package:quiz_app/view/Result.dart';

class HomePageController extends GetxController {
  List<QuizModel> quiz = questions;
  int inde = 0;
  int result = 0;
  bool color = false;
  late String resultText;

  changeInde(index) {
    quiz[inde].answers[index] == quiz[inde].correct ? correct() : go();
    // inde != 4
    //     ? inde++
    //     : Get.off(() => Result(
    //           result: result,
    //         ));
    update();
  }

  correct() async {
    result += 10;
    color = true;
    await Future.delayed(const Duration(milliseconds: 300));
    update();
    inde != 4
        ? inde++
        : Get.off(() => Result(
              result: result,
            ));
    color = false;
    update();
  }

  go() {
    inde != 4
        ? inde++
        : Get.off(() => Result(
              result: result,
            ));
  }

  String getText() {
    if (result >= 40) {
      resultText = "Excellent";
    } else if (result <= 20) {
      resultText = "Very Bad";
    } else {
      resultText = "Good";
    }
    return resultText;
  }
}

List<QuizModel> questions = [
  QuizModel(
    question: "What is the number of letters in the alphabet?",
    answers: ["26", "25", "27", "28"],
    correct: "26",
  ),
  QuizModel(
    question: "What is the capital of France?",
    answers: ["Paris", "London", "Rome", "Madrid"],
    correct: "Paris",
  ),
  QuizModel(
    question: "What is the color of the sky on a clear day?",
    answers: ["Blue", "Green", "Red", "Yellow"],
    correct: "Blue",
  ),
  QuizModel(
    question: "What is the name of the animal that lays eggs?",
    answers: ["Chicken", "Dog", "Cat", "Horse"],
    correct: "Chicken",
  ),
  QuizModel(
    question: "What is the name of the fruit that is red and has a long stem?",
    answers: ["Apple", "Banana", "Grapes", "Orange"],
    correct: "Apple",
  ),
];
