import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vmp/components/buttons.dart';
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
          style: alertStyle,
          // type: generator.getVerdict() ? AlertType.info : AlertType.info,
          title: generator.getVerdict()
              ? 'AI AI Captain!\nGratulujem!'
              : 'TEST CEZ PALUBU!\nĽutujem',
          content: Column(
            children: [
              Icon(
                generator.getVerdict() ? Icons.check : Icons.close,
                color: kTextColour,
                size: 50.0,
              ),
              Text(
                'Počet správne zodpovedaných otázok: ' +
                    generator.getResult().toString() +
                    '\nMinimálny počet: ' +
                    generator.getMinimum(),
                style: kAlertTextButton,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          // desc: 'Počet správne zodpovedaných otázok: ' +
          //     generator.getResult().toString() +
          //     '\nMinimálny počet: ' +
          //     generator.getMinimum(),
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
              color: kDefaultColorButton,
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
              color: Color(0xFF303F9F),
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
        title: AutoSizeText(
          'Vodca malého plavidla',
          style: kOptionTextButton,
          maxLines: 1,
        ),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'MENU',
                style: kOptionTextButton,
                textAlign: TextAlign.right,
              ),
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
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: generator.getQuestionImage() == '/' ? 2 : 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  generator.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: kQuestionTextButton,
                ),
              ),
            ),
          ),
          Expanded(
            flex: generator.getQuestionImage() == '/' ? 0 : 2,
            child: Center(
              child: generator.getQuestionImage() == '/'
                  ? Text('')
                  : Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image(
                        image: AssetImage(
                          generator.getQuestionImage(),
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
            ),
          ),
          Expanded(
            child: OptionButton(
              questionOptionText: generator.getQuestionOptions(0),
              onPressed: () {
                checkAnswer(0);
              },
            ),
          ),
          Expanded(
            child: OptionButton(
              questionOptionText: generator.getQuestionOptions(1),
              onPressed: () {
                checkAnswer(1);
              },
            ),
          ),
          Expanded(
            child: OptionButton(
              questionOptionText: generator.getQuestionOptions(2),
              onPressed: () {
                checkAnswer(2);
              },
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
