import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vmp/screens/home_page.dart';

import 'constants.dart';

void main() => runApp(VMP());

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
