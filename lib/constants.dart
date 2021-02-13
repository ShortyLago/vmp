import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const kBottomContainerHeight = 80.0;
const kTextColour = Color(0xFFBBDEFB);
const kDefaultColorButton = Color(0xFF1976D2);
const kCorrectColorButton = Color(0xFF4CAF50);
const kWrongColorButton = Color(0xFFD32F2F);
const kBackgroundColour = Color(0xFF2196F3);

// const kTitleTextButton = TextStyle(
//   fontSize: 20.0,
//   fontWeight: FontWeight.bold,
// );

const kAlertTextButton = TextStyle(
  color: kTextColour,
  fontSize: 20,
  height: 1,
);

const kOptionTextButton = TextStyle(
  color: kTextColour,
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
);

const kQuestionTextButton = TextStyle(
  color: kTextColour,
  fontSize: 27.0,
  fontWeight: FontWeight.w800,
);

var alertStyle = AlertStyle(
  backgroundColor: kBackgroundColour,
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  descTextAlign: TextAlign.center,
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    // side: BorderSide(
    //   color: Colors.grey,
    // ),
  ),
  titleStyle: TextStyle(
    height: 1,
    color: kTextColour,
  ),
  alertAlignment: Alignment.center,
);
