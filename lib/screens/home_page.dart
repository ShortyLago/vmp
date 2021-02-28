import 'package:Lodicak/components/autosized_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Lodicak/components/buttons.dart';
import 'package:Lodicak/components/constants.dart';
import 'package:Lodicak/questions/generator.dart';
import 'package:Lodicak/screens/quiz_page.dart';
import 'package:sentry/sentry.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeWidget(
          text: 'Vodca malého plavidla',
          style: kOptionTextButton,
          key: Key('title'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Image(
              image: AssetImage('images/app/appstore.png'),
              // fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: AutoSizeWidget(
                text: 'Vyberte kategóriu testu:',
                style: kQuestionTextButton,
                key: Key('text_1'),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: MainButton(
              buttonTitle: 'Vodca malého plavidla kategórie A',
              onTap: () async {
                try {
                  Generator generator = Generator(quizType: 0);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(generator: generator),
                    ),
                  );
                } catch (exception, stackTrace) {
                  await Sentry.captureException(
                    exception,
                    stackTrace: stackTrace,
                  );
                }
              },
              buttonColour: kMenuDarkBlueColor,
              key: Key('text_2'),
            ),
          ),
          Expanded(
            child: MainButton(
              buttonTitle: 'Vodca malého plavidla kategórie B',
              onTap: () async {
                try {
                  Generator generator = Generator(quizType: 1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(generator: generator),
                    ),
                  );
                } catch (exception, stackTrace) {
                  await Sentry.captureException(
                    exception,
                    stackTrace: stackTrace,
                  );
                }
              },
              buttonColour: kMenuDarkBlueColor2,
              key: Key('text_3'),
            ),
          ),
          Expanded(
            child: MainButton(
              buttonTitle: 'Vodca malého plavidla kategórie C',
              onTap: () async {
                try {
                  Generator generator = Generator(quizType: 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(generator: generator),
                    ),
                  );
                } catch (exception, stackTrace) {
                  await Sentry.captureException(
                    exception,
                    stackTrace: stackTrace,
                  );
                }
              },
              buttonColour: kMenuLightBlueColor,
              key: Key('text_4'),
            ),
          ),
          Expanded(
            child: MainButton(
              buttonTitle: 'Vodca malého plavidla kategórie D',
              onTap: () async {
                try {
                  Generator generator = Generator(quizType: 3);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(generator: generator),
                    ),
                  );
                } catch (exception, stackTrace) {
                  await Sentry.captureException(
                    exception,
                    stackTrace: stackTrace,
                  );
                }
              },
              buttonColour: kMenuLightBlueColor2,
              key: Key('text_5'),
            ),
          ),
          SizedBox(height: 100.0,)
        ],
      ),
    );
  }
}
