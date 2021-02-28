import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Lodicak/components/constants.dart';

import 'autosized_widget.dart';

class MainButton extends StatelessWidget {
  MainButton({@required this.buttonTitle,
    @required this.onTap,
    @required this.buttonColour,
  this.key
  });

  final String buttonTitle;
  final Function onTap;
  final Color buttonColour;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: AutoSizeWidget(
            text: buttonTitle,
            style: kOptionTextButton,
          ),
        ),
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        decoration: BoxDecoration(
          color: buttonColour,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
      ),
      key: key,
    );
  }
}

class OptionButton extends StatefulWidget {
  OptionButton({this.colour = kDefaultColorButton,
    @required this.onPressed,
    @required this.questionOptionText,
    this.key
  });

  Color colour;
  Function onPressed;
  String questionOptionText;
  Key key;

  @override
  _OptionButtonState createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: widget.colour,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        child: AutoSizeWidget(
            text: widget.questionOptionText,
            style: kOptionTextButton,
            key: widget.key,
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
