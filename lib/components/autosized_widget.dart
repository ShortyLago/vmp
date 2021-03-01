import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class AutoSizeWidget extends StatelessWidget {
  const AutoSizeWidget({this.text, this.style, this.key});

  final String text;
  final TextStyle style;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: style,
      key: key,
      textAlign: TextAlign.center,
      minFontSize: 10.0,
      maxFontSize: style.fontSize,
      // maxLines: style == kResultsWhite ? 2 : 1,
    );
  }
}
