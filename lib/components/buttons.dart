import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
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
          child: AutoSizeText(
            buttonTitle,
            style: kOptionTextButton,
            maxLines: 1,
          ),
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
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

class OptionButton extends StatefulWidget {
  OptionButton(
      {this.colour = kDefaultColorButton,
      @required this.onPressed,
      @required this.questionOptionText});

  Color colour;
  Function onPressed;
  String questionOptionText;

  @override
  _OptionButtonState createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0, bottom: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: widget.colour,
        // border: Border.all(
        //   color: Colors.black,
        //   width: 2,
        // ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: FlatButton(
        // textColor: Colors.black,
        child: AutoSizeText(
          widget.questionOptionText,
          textAlign: TextAlign.center,
          style: kOptionTextButton,
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
