import 'package:auto_size_text/auto_size_text.dart';
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
        // automaticallyImplyLeading: false,
        title: AutoSizeText(
          'Vodca malého plavidla',
          style: kOptionTextButton,
          maxLines: 1,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            // alignment: Alignment.center,
            // height: 300.0,
            child: Center(
              child: AutoSizeText(
                'Vyberte kategóriu testu:',
                style: kQuestionTextButton,
                maxLines: 1,
                // textAlign: TextAlign.center,
              ),
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
              buttonColour: Color(0xFF303F9F),
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
              buttonColour: Color(0xFF3F51B5),
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
              buttonColour: Color(0xFF448AFF),
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
              buttonColour: Color(0xFF03A9F4),
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
