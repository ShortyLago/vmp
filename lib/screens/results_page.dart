import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmp/constants.dart';
import 'package:vmp/questions/generator.dart';
import 'package:vmp/questions/questions.dart';

class ResultPage extends StatefulWidget {
  ResultPage({@required this.generator});
  final Generator generator;

  @override
  _ResultPageState createState() => _ResultPageState(generator: generator);
}

class _ResultPageState extends State<ResultPage> {
  Generator generator;
  // Generator generator;
  List<Question> questions;

  _ResultPageState({@required this.generator}) {
    // generator = Generator(quizType: quizType);
    // questions = generator.questionBank;
    generator = this.generator;
    generator.resetQuestionNumber();
  }

  Color checkAnswer(int userPickedAnswer) {
    if (userPickedAnswer == generator.getCorrectAnswer()) {
      return kCorrectColorButton;
    } else if (generator.getAttempt() == userPickedAnswer &&
        generator.getAttempt() != generator.getCorrectAnswer()) {
      return kWrongColorButton;
    } else {
      return kDefaultColorButton;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vodca Malého Plavidla',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.redAccent,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: FlatButton(
              child: Text(
                'HLAVNÉ MENU',
                style: kOptionsTextButton,
              ),
              onPressed: () {
                setState(() {});
              },
            ),
          ),
          Expanded(
            // flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  generator.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: generator.getQuestionImage() == '' ? 0 : 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Image(
                  image: AssetImage(
                    generator.getQuestionImage(),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
                child: IconButton(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.centerLeft,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  tooltip: 'Predchádzajúca otázka',
                  onPressed: () {
                    setState(() {
                      generator.previousQuestion();
                    });
                  },
                ),
              ),
              IconButton(
                alignment: Alignment.center,
                onPressed: () {},
                icon: generator.getAttempt() == generator.getCorrectAnswer()
                    ? Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
                child: IconButton(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.centerRight,
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  tooltip: 'Následujúca otázka',
                  onPressed: () {
                    setState(() {
                      generator.nextQuestion();
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(
                  left: 15.0, top: 10.0, right: 15.0, bottom: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: checkAnswer(0),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: FlatButton(
                // textColor: Colors.black,
                child: Text(
                  generator.getQuestionOptions(0),
                  textAlign: TextAlign.center,
                  style: kOptionsTextButton,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(
                  left: 15.0, top: 10.0, right: 15.0, bottom: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: checkAnswer(1),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: FlatButton(
                // textColor: Colors.white,
                child: Text(
                  generator.getQuestionOptions(1),
                  textAlign: TextAlign.center,
                  style: kOptionsTextButton,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(
                  left: 15.0, top: 10.0, right: 15.0, bottom: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: checkAnswer(2),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: FlatButton(
                // textColor: Colors.white,
                child: Text(
                  generator.getQuestionOptions(2),
                  textAlign: TextAlign.center,
                  style: kOptionsTextButton,
                ),
                onPressed: () {
                  // checkAnswer(2);
                },
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       child: Icon(Icons.arrow_back),
      //       onPressed: () {
      //         setState(() {
      //           generator.previousQuestion();
      //         });
      //       },
      //       heroTag: null,
      //     ),
      //     SizedBox(
      //       width: 300.0,
      //     ),
      //     FloatingActionButton(
      //       child: Icon(Icons.arrow_forward),
      //       onPressed: () {
      //         setState(() {
      //           generator.nextQuestion();
      //         });
      //       },
      //       heroTag: null,
      //     ),
      //   ],
      // ),
    );
  }
}
