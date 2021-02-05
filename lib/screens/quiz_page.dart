import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vmp/constants.dart';
import 'package:vmp/questions/generator.dart';
import 'package:vmp/questions/questions.dart';
import 'package:vmp/screens/results_page.dart';

import 'home_page.dart';

class QuizPage extends StatefulWidget {
  QuizPage({@required this.generator});
  final Generator generator;

  @override
  _QuizPageState createState() => _QuizPageState(generator: generator);
}

class _QuizPageState extends State<QuizPage> {
  Generator generator;
  // Generator generator;
  List<Question> questions;

  _QuizPageState({@required this.generator}) {
    // generator = Generator(quizType: quizType);
    // questions = generator.questionBank;
    generator = this.generator;
  }

  void checkAnswer(int userPickedAnswer) {
    setState(() {
      generator.saveAnswer(userPickedAnswer);
      if (generator.isFinished() == true) {
        Alert(
          context: context,
          type: generator.getVerdict() ? AlertType.success : AlertType.error,
          title: 'Hotovo!',
          desc: 'Zodpovedali ste na všetky otázky.',
          buttons: [
            DialogButton(
              child: Text(
                'VÝSLEDKY',
                style: kAlertTextButton,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      generator: generator,
                    ),
                  ),
                );
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
            DialogButton(
              child: Text(
                'MENU',
                style: kAlertTextButton,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              color: Colors.red,
            ),
          ],
        ).show();
      } else {
        generator.nextQuestion();
      }
    });
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
          Expanded(
            flex: 2,
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
            flex: 1,
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: FlatButton(
                // textColor: Colors.black,
                color: Color(0xFF0288D1),
                child: Text(
                  generator.getQuestionOptions(0),
                  textAlign: TextAlign.center,
                  style: kOptionsTextButton,
                ),
                onPressed: () {
                  checkAnswer(0);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: FlatButton(
                // textColor: Colors.white,
                color: Color(0xFF0288D1),
                child: Text(
                  generator.getQuestionOptions(1),
                  textAlign: TextAlign.center,
                  style: kOptionsTextButton,
                ),
                onPressed: () {
                  checkAnswer(1);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: FlatButton(
                // textColor: Colors.white,
                color: Color(0xFF0288D1),
                child: Text(
                  generator.getQuestionOptions(2),
                  textAlign: TextAlign.center,
                  style: kOptionsTextButton,
                ),
                onPressed: () {
                  checkAnswer(2);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
