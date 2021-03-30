import 'package:flutter/material.dart';

class TextAmountAndPrice extends StatelessWidget {
  const TextAmountAndPrice({
    Key key,
    @required this.text,
    @required this.textInfo,
  }) : super(key: key);
  final String text;
  final String textInfo;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: textInfo,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
