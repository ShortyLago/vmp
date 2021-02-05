import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmp/constants.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {@required this.buttonTitle,
      @required this.onTap,
      @required this.buttonColour});

  final String buttonTitle;
  final Function onTap;
  final Color buttonColour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kTitleTextButton,
          ),
        ),
        margin: EdgeInsets.all(10.0),
        // padding: EdgeInsets.all(20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        decoration: BoxDecoration(
          color: buttonColour,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
