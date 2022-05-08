import 'package:flutter/material.dart';
import 'constants.dart';

class Content extends StatelessWidget {
  Content({this.message, this.ico});
  final String? message;
  final IconData? ico;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ico,
          size: 80,
        ),
        gap,
        Text(
          message!,
          style: styleText,
        )
      ],
    );
  }
}
