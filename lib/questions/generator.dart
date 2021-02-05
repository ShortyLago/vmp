import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vmp/questions/questions_cevni.dart';
import 'package:vmp/questions/questions_elektro.dart';
import 'package:vmp/questions/questions_plachty.dart';
import 'package:vmp/questions/questions_zakon.dart';
import 'package:vmp/questions/questions_zemepis.dart';

import 'questions.dart';

class Generator {
  // VARIABLES
  final int quizType;
  var rng = new Random();
  int _questionNumber = 0;
  int _resultsCount = 0;
  List<int> _minResults = [24, 6, 6, 23];

  List<Question> _questionBank = [];
  List<int> _answers = [];
  List<int> randomCevni = [];
  List<int> randomZakon = [];
  List<int> randomZemepis = [];
  List<int> randomElektro = [];
  List<int> randomPlachty = [];

  // CONSTRUCTOR
  Generator({@required this.quizType}) {
    // A + D
    if (quizType == 0 || quizType == 3) {
      // CEVNI
      for (var i = 0; i < 20; i++) {
        int randomNum = rng.nextInt(questionsCevni.length);
        while (randomCevni.contains(randomNum)) {
          randomNum = rng.nextInt(questionsCevni.length);
        }
        randomCevni.add(randomNum);
      }
      for (var i = 0; i < randomCevni.length; i++) {
        _questionBank.add(questionsCevni[randomCevni[i]]);
      }
      // ZAKON
      for (var i = 0; i < 4; i++) {
        int randomNum = rng.nextInt(questionsZakon.length);
        while (randomZakon.contains(randomNum)) {
          randomNum = rng.nextInt(questionsZakon.length);
        }
        randomZakon.add(randomNum);
      }
      for (var i = 0; i < randomZakon.length; i++) {
        _questionBank.add(questionsZakon[randomZakon[i]]);
      }
      // Zemepis
      for (var i = 0; i < 4; i++) {
        int randomNum = rng.nextInt(questionsZemepis.length);
        while (randomZemepis.contains(randomNum)) {
          randomNum = rng.nextInt(questionsZemepis.length);
        }
        randomZemepis.add(randomNum);
      }
      for (var i = 0; i < randomZemepis.length; i++) {
        _questionBank.add(questionsZemepis[randomZemepis[i]]);
      }
    }
    // B
    else if (quizType == 1) {
      // ELEKTRO
      for (var i = 0; i < 7; i++) {
        int randomNum = rng.nextInt(questionsElektro.length);
        while (randomElektro.contains(randomNum)) {
          randomNum = rng.nextInt(questionsElektro.length);
        }
        randomElektro.add(randomNum);
      }
      for (var i = 0; i < randomElektro.length; i++) {
        _questionBank.add(questionsElektro[randomElektro[i]]);
      }
    }
    // C
    else if (quizType == 2) {
      // PLACHTY
      for (var i = 0; i < 7; i++) {
        int randomNum = rng.nextInt(questionsPlachty.length);
        while (randomPlachty.contains(randomNum)) {
          randomNum = rng.nextInt(questionsPlachty.length);
        }
        randomPlachty.add(randomNum);
      }
      for (var i = 0; i < randomPlachty.length; i++) {
        _questionBank.add(questionsPlachty[randomPlachty[i]]);
      }
    }

    _questionBank.shuffle();
  }

  // FUNCTIONS
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  void previousQuestion() {
    if (_questionNumber > 0) {
      _questionNumber--;
    }
  }

  int getAttempt() {
    return _answers[_questionNumber];
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionBank[_questionNumber].image;
  }

  String getQuestionOptions(int i) {
    return _questionBank[_questionNumber].options[i];
  }

  void saveAnswer(int i) {
    if (_answers.length < _questionBank.length) {
      _answers.insert(_questionNumber, i);
    }
  }

  int getCorrectAnswer() {
    return _questionBank[_questionNumber].correctOption;
  }

  void resetQuestionNumber() {
    _questionNumber = 0;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  bool getVerdict() {
    // A
    if (quizType == 0 && getResult() >= _minResults[0]) {
      return true;
      // B
    } else if (quizType == 1 && getResult() >= _minResults[1]) {
      return true;
      // C
    } else if (quizType == 2 && getResult() >= _minResults[2]) {
      return true;
      // D
    } else if (quizType == 3 && getResult() >= _minResults[3]) {
      return true;
    } else {
      return false;
    }
  }

  String getMinimum() {
    return _minResults[quizType].toString();
  }

  int getResult() {
    _resultsCount = 0;
    for (var i = 0; i <= _answers.length - 1; i++) {
      if (_answers[i] == _questionBank[i].correctOption) {
        _resultsCount++;
      }
    }
    return _resultsCount;
  }
}
