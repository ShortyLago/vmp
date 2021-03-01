import 'dart:math';

import 'package:flutter/material.dart';
import 'package:Lodicak/questions/questions_list/questions_cevni.dart';
import 'package:Lodicak/questions/questions_list/questions_elektro.dart';
import 'package:Lodicak/questions/questions_list/questions_plachty.dart';
import 'package:Lodicak/questions/questions_list/questions_zakon.dart';
import 'package:Lodicak/questions/questions_list/questions_zemepis.dart';

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
  List<int> _randomCevni = [];
  List<int> _randomZakon = [];
  List<int> _randomZemepis = [];
  List<int> _randomElektro = [];
  List<int> _randomPlachty = [];

  // CONSTRUCTOR
  Generator({@required this.quizType}) {
    // A + D
    if (quizType == 0 || quizType == 3) {
      // CEVNI
      for (var i = 0; i < 20; i++) {
        int randomNum = rng.nextInt(questionsCevni.length);
        while (_randomCevni.contains(randomNum)) {
          randomNum = rng.nextInt(questionsCevni.length);
        }
        _randomCevni.add(randomNum);
      }
      for (var i = 0; i < _randomCevni.length; i++) {
        _questionBank.add(questionsCevni[_randomCevni[i]]);
      }
      // ZAKON
      for (var i = 0; i < 4; i++) {
        int randomNum = rng.nextInt(questionsZakon.length);
        while (_randomZakon.contains(randomNum)) {
          randomNum = rng.nextInt(questionsZakon.length);
        }
        _randomZakon.add(randomNum);
      }
      for (var i = 0; i < _randomZakon.length; i++) {
        _questionBank.add(questionsZakon[_randomZakon[i]]);
      }
      // ZEMEPIS
      for (var i = 0; i < 4; i++) {
        int randomNum = rng.nextInt(questionsZemepis.length);
        while (_randomZemepis.contains(randomNum)) {
          randomNum = rng.nextInt(questionsZemepis.length);
        }
        _randomZemepis.add(randomNum);
      }
      for (var i = 0; i < _randomZemepis.length; i++) {
        _questionBank.add(questionsZemepis[_randomZemepis[i]]);
      }
    }
    // B
    else if (quizType == 1) {
      // ELEKTRO
      for (var i = 0; i < 7; i++) {
        int randomNum = rng.nextInt(questionsElektro.length);
        while (_randomElektro.contains(randomNum)) {
          randomNum = rng.nextInt(questionsElektro.length);
        }
        _randomElektro.add(randomNum);
      }
      for (var i = 0; i < _randomElektro.length; i++) {
        _questionBank.add(questionsElektro[_randomElektro[i]]);
      }
    }
    // C
    else if (quizType == 2) {
      // PLACHTY
      for (var i = 0; i < 7; i++) {
        int randomNum = rng.nextInt(questionsPlachty.length);
        while (_randomPlachty.contains(randomNum)) {
          randomNum = rng.nextInt(questionsPlachty.length);
        }
        _randomPlachty.add(randomNum);
      }
      for (var i = 0; i < _randomPlachty.length; i++) {
        _questionBank.add(questionsPlachty[_randomPlachty[i]]);
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

  String questionPossition() {
    return (_questionNumber + 1).toString() + '/' + (_questionBank.length).toString();
  }

  int resultPosition() {
    if (_questionNumber == 0) {
      return 0;
    } else if (_questionNumber == _questionBank.length - 1) {
      return 1;
    } else {
      return 2;
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
