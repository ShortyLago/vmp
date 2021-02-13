import 'package:auto_size_text/auto_size_text.dart';
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
          // Container(
          //   margin: EdgeInsets.all(20.0),
          //   color: Color(0xFF2196F3),
          //   child: FlatButton(
          //     child: Text(
          //       'HLAVNÉ MENU',
          //       style: kOptionTextButton,
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => HomePage(),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          Expanded(
            flex: generator.getQuestionImage() == '/' ? 2 : 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: AutoSizeText(
                  generator.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: kQuestionTextButton,
                ),
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
                  color: kDefaultColorButton,
                ),
                child: IconButton(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.centerLeft,
                  icon: Icon(
                    Icons.arrow_back,
                    color: kTextColour,
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
                  color: kDefaultColorButton,
                ),
                child: IconButton(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.centerRight,
                  icon: Icon(
                    Icons.arrow_forward,
                    color: kTextColour,
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
