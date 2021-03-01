import 'package:Lodicak/components/autosized_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Lodicak/components/buttons.dart';
import 'package:Lodicak/components/constants.dart';
import 'package:Lodicak/questions/generator.dart';
import 'package:Lodicak/questions/questions.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
        title: AutoSizeWidget(
          text: 'Vodca malého plavidla',
          style: kOptionTextButton,
          key: Key('title'),
        ),
        leading: Center(
          child: AutoSizeWidget(
            text: generator.questionPossition(),
            style: kOptionTextButton,
            key: Key('text_possition'),
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
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: generator.getQuestionImage() == '/'
                    ? Text('')
                    : Image(
                        image: AssetImage(
                          generator.getQuestionImage(),
                        ),
                        fit: BoxFit.contain,
                      ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: generator.resultPosition() == 0
                      ? kBackgroundColour
                      : kDefaultColorButton,
                ),
                child: IconButton(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.centerLeft,
                  splashColor: generator.resultPosition() == 0
                      ? kBackgroundColour
                      : kTextColour,
                  icon: Icon(
                    Icons.arrow_back,
                    color: generator.resultPosition() == 0
                        ? kBackgroundColour
                        : kTextColour,
                  ),
                  tooltip: 'Predchádzajúca otázka',
                  onPressed: generator.resultPosition() == 0
                      ? () {}
                      : () async {
                          try {
                            setState(
                              () {
                                generator.previousQuestion();
                              },
                            );
                          } catch (exception, stackTrace) {
                            await Sentry.captureException(
                              exception,
                              stackTrace: stackTrace,
                            );
                          }
                        },
                ),
              ),
              generator.getAttempt() == generator.getCorrectAnswer()
                  ? Icon(
                      Icons.check,
                      color: kTextColour,
                      size: 50.0,
                    )
                  : Icon(
                      Icons.close,
                      color: kTextColour,
                      size: 50.0,
                    ),
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: generator.resultPosition() == 1
                      ? kBackgroundColour
                      : kDefaultColorButton,
                ),
                child: IconButton(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.centerRight,
                  splashColor: generator.resultPosition() == 1
                      ? kBackgroundColour
                      : kTextColour,
                  icon: Icon(
                    Icons.arrow_forward,
                    color: generator.resultPosition() == 1
                        ? kBackgroundColour
                        : kTextColour,
                  ),
                  tooltip: 'Následujúca otázka',
                  onPressed: generator.resultPosition() == 1
                      ? () {}
                      : () async {
                          try {
                            setState(
                              () {
                                generator.nextQuestion();
                              },
                            );
                          } catch (exception, stackTrace) {
                            await Sentry.captureException(
                              exception,
                              stackTrace: stackTrace,
                            );
                          }
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
