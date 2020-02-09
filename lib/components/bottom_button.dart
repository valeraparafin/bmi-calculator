import 'package:flutter/material.dart';
import '../constans.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonText});

  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Center(
          child: Text(
        buttonText,
        style: kLargeButtonText,
      )),
    );
  }
}
