import 'dart:math';

import 'package:quizzler/questions.dart';

class QuizBrain {
  int questionsCount = 0;
  int questionsLeft = 0;
  int questionNumber = 0;

  QuizBrain() {
    questionsCount = _questionBank.length;
    questionsLeft = questionsCount;
    questionNumber = Random().nextInt(questionsLeft);
  }

  final List<Question> _questionBank = [
    Question(
      question: 'A slug\'s blood is green.',
      answer: true,
    ),
    Question(
      question: 'Some cats are actually allergic to humans.',
      answer: true,
    ),
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
      question: 'Approximately one quarter of human bones are in the feet.',
      answer: true,
    ),
    Question(
      question: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
      answer: true,
    ),
    Question(
      question: 'It is illegal to pee in the Ocean in Portugal.',
      answer: true,
    ),
    Question(
      question:
          'No piece of square dry paper can be folded in half more than 7 times.',
      answer: false,
    ),
    Question(
      question:
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      answer: true,
    ),
    Question(
      question:
          'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      answer: false,
    ),
    Question(
      question:
          'The total surface area of two human lungs is approximately 70 square metres.',
      answer: true,
    ),
    Question(
      question: 'Google was originally called "Backrub".',
      answer: true,
    ),
    Question(
      question:
          'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      answer: true,
    ),
    Question(
      question:
          'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      answer: true,
    ),
  ];

  void reset() {
    questionsLeft = questionsCount;
    questionNumber = Random().nextInt(questionsLeft);
  }

  int getQuestionCount() => _questionBank.length;

  String nextQuestion() =>
      _questionBank[questionNumber = Random().nextInt(questionsLeft)].question;

  void markAnswered() {
    var currQuestion = _questionBank[questionNumber];
    currQuestion.isAnswered = true;

    // Shift the last question answered at end of the list
    // so that it won't be chosen again.
    _questionBank.removeAt(questionNumber);
    _questionBank.add(currQuestion);

    questionsLeft--;
  }

  bool getCorrectAnswer() => _questionBank[questionNumber].answer;

  bool isFinished() => questionsLeft == 1;

  void addQuestion({required String question, required bool answer}) =>
      _questionBank.add(Question(
        question: question,
        answer: answer,
      ));
}
