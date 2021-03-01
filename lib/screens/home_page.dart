import 'package:Lodicak/components/autosized_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Lodicak/components/buttons.dart';
import 'package:Lodicak/components/constants.dart';
import 'package:Lodicak/questions/generator.dart';
import 'package:Lodicak/screens/quiz_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sentry/sentry.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void infoAlert () {
    setState(() {
      Alert(
        context: context,
        style: alertButton(isCloseButton: true, isOverlayTapDismiss: true),
        title: 'Viac informácií:',
        content: Image(
          image: AssetImage('images/app/test_yes.png'),
          alignment: Alignment.center,
          width: 100.0,
        ),
        buttons: [
          DialogButton(
            child: Text(
              'DOPRAVNÝ\nÚRAD',
              style: kInfoTextButton,
              textAlign: TextAlign.center,
              key: Key('alert_btn1'),
            ),
            onPressed: () async {
               await launch('http://plavba.nsat.sk/odborne-sposobilosti/vodca-maleho-plavidla/');
            },
            color: kDefaultColorButton,
          ),
          DialogButton(
            child: Text(
              'KAPITÁNSKE\nKURZY',
              style: kInfoTextButton,
              textAlign: TextAlign.center,
              key: Key('alert_btn2'),
            ),
            onPressed: () async {
              await launch('http://kapitanskykurz.sk/');
            },
            color: kMenuDarkBlueColor,
          ),
        ],
      ).show();
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Image(
              image: AssetImage('images/app/test_yes.png'),
              // fit: BoxFit.contain,
            ),
          ),
          Expanded(
            // flex: 2,
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
          Expanded(
            child: Container(
              height: 100.0,
              alignment: Alignment.topRight,
              child: IconButton(icon: Icon(Icons.info, color: kTextColour,), onPressed: infoAlert),
            ),
          )
        ],
      ),
    );
  }
}
