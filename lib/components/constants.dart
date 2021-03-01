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
const kMenuDarkBlueColor = Color(0xFF303F9F);
const kMenuDarkBlueColor2 = Color(0xFF3F51B5);
const kMenuLightBlueColor = Color(0xFF448AFF);
const kMenuLightBlueColor2 = Color(0xFF03A9F4);

const kAlertTextButton = TextStyle(
  color: kTextColour,
  fontSize: 18.0,
  height: 1,
);

const kInfoTextButton = TextStyle(
  color: kTextColour,
  fontSize: 15.0,
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

var alertStyle = alertButton();

AlertStyle alertButton({bool isCloseButton = false, bool isOverlayTapDismiss = false}) {
  return AlertStyle(
backgroundColor: kBackgroundColour,
animationType: AnimationType.fromTop,
isCloseButton: isCloseButton,
isOverlayTapDismiss: isOverlayTapDismiss,
descTextAlign: TextAlign.center,
animationDuration: Duration(milliseconds: 400),
alertBorder: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20.0),
),
titleStyle: TextStyle(
  height: 1,
  color: kTextColour,
),
alertAlignment: Alignment.center,
);
}
