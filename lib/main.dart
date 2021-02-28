import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Lodicak/screens/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'components/constants.dart';

Future<void> main() async {
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://12c25f5b966447909c27f5f8dabd504f@o524914.ingest.sentry.io/5652558';
    },
    appRunner: () => runApp(VMP()),
  );
}

class VMP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: kDefaultColorButton,
        scaffoldBackgroundColor: kBackgroundColour,
        // buttonColor: Color(0xFF009688),
      ),
      home: Scaffold(
        backgroundColor: kBackgroundColour,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
