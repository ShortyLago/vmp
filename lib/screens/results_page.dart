import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmp/components/buttons.dart';
import 'package:vmp/constants.dart';
import 'package:vmp/questions/generator.dart';
import 'package:vmp/questions/questions.dart';

import 'home_page.dart';

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
          'Vodca malého plavidla',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
          ),
          Expanded(
            // flex: 1,
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
            flex: generator.getQuestionImage() == '' ||
                    generator.getQuestionImage() == '/'
                ? 0
                : 2,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: generator.getQuestionImage() == '' ||
                        generator.getQuestionImage() == '/'
                    ? Text('')
                    : Image(
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
              generator.getAttempt() == generator.getCorrectAnswer()
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 50.0,
                    )
                  : Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 50.0,
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
            child: OptionButton(
              colour: checkAnswer(0),
              questionOptionText: generator.getQuestionOptions(0),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: OptionButton(
              colour: checkAnswer(1),
              questionOptionText: generator.getQuestionOptions(1),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: OptionButton(
              colour: checkAnswer(2),
              questionOptionText: generator.getQuestionOptions(2),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
