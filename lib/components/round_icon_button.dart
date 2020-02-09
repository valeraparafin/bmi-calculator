import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {@required this.icon, @required this.onTap, @required this.onDoubleTap});

  final IconData icon;
  final Function onTap;
  final Function onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      onLongPress: onDoubleTap,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
