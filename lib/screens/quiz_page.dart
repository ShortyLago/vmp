import 'dart:ui';

import 'package:Lodicak/components/autosized_widget.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:Lodicak/components/buttons.dart';
import 'package:Lodicak/components/constants.dart';
import 'package:Lodicak/questions/generator.dart';
import 'package:Lodicak/questions/questions.dart';
import 'package:Lodicak/screens/results_page.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'home_page.dart';

class QuizPage extends StatefulWidget {
  QuizPage({@required this.generator});

  final Generator generator;

  @override
  _QuizPageState createState() => _QuizPageState(generator: generator);
}

class _QuizPageState extends State<QuizPage> {
  Generator generator;
  List<Question> questions;

  _QuizPageState({@required this.generator}) {
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
              Image(
                image: AssetImage('images/app/appstore.png'),
                width: 100.0,
              ),
              Text(
                  'Správne zodpovedané otázky: ' +
                      generator.getResult().toString() +
                      '\nMinimálny počet: ' +
                      generator.getMinimum(),
                  style: kAlertTextButton,
                  textAlign: TextAlign.center,
                  key: Key('alert_content')),
            ],
          ),
          buttons: [
            DialogButton(
              child: Text(
                'VÝSLEDKY',
                style: kAlertTextButton,
                key: Key('alert_btn1'),
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
                key: Key('alert_btn2'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              color: kMenuDarkBlueColor,
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
        title: AutoSizeWidget(
          text: 'Vodca malého plavidla',
          style: kOptionTextButton,
          key: Key('title'),
        ),
        leading: Center(
          child: Text(
            generator.questionPossition(),
            style: kOptionTextButton,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'MENU',
                style: kAlertTextButton,
                textAlign: TextAlign.right,
              ),
            ),
            onPressed: () async {
              try {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              } catch (exception, stackTrace) {
                await Sentry.captureException(
                  exception,
                  stackTrace: stackTrace,
                );
              }
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
                child: AutoSizeWidget(
                    text: generator.getQuestionText(),
                    style: kQuestionTextButton,
                    key: Key('text_question')),
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
              onPressed: () async {
                try {
                  checkAnswer(0);
                } catch (exception, stackTrace) {
                  await Sentry.captureException(
                    exception,
                    stackTrace: stackTrace,
                  );
                }
              },
            ),
          ),
          Expanded(
            child: OptionButton(
              questionOptionText: generator.getQuestionOptions(1),
              onPressed: () async {
                try {
                  checkAnswer(1);
                } catch (exception, stackTrace) {
                  await Sentry.captureException(
                    exception,
                    stackTrace: stackTrace,
                  );
                }
              },
            ),
          ),
          Expanded(
            child: OptionButton(
              questionOptionText: generator.getQuestionOptions(2),
              onPressed: () async {
                try {
                  checkAnswer(2);
                } catch (exception, stackTrace) {
                  await Sentry.captureException(
                    exception,
                    stackTrace: stackTrace,
                  );
                }
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
