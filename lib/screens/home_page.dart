import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vmp/components/buttons.dart';
import 'package:vmp/constants.dart';
import 'package:vmp/questions/generator.dart';
import 'package:vmp/screens/quiz_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vodca Malého Plavidla',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 300.0,
            child: Text(
              'Vyberte kategóriu testu:',
              style: kTitleTextButton,
              // textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: MainButton(
              buttonTitle: 'Vodca malého plavidla kategórie A',
              onTap: () {
                Generator generator = Generator(quizType: 0);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(generator: generator),
                  ),
                );
              },
              buttonColour: Colors.white,
            ),
          ),
          Expanded(
            child: MainButton(
              buttonTitle: 'Vodca malého plavidla kategórie B',
              onTap: () {
                Generator generator = Generator(quizType: 1);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(generator: generator),
                  ),
                );
              },
              buttonColour: Colors.blue.shade800,
            ),
          ),
          Expanded(
            child: MainButton(
              buttonTitle: 'Vodca malého plavidla kategórie C',
              onTap: () {
                Generator generator = Generator(quizType: 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(generator: generator),
                  ),
                );
              },
              buttonColour: Colors.blue,
            ),
          ),
          Expanded(
            child: MainButton(
              buttonTitle: 'Vodca malého plavidla kategórie D',
              onTap: () {
                Generator generator = Generator(quizType: 3);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(generator: generator),
                  ),
                );
              },
              buttonColour: Colors.red,
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
