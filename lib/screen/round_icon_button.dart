import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onpress});

  final IconData? icon;
  void Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFFE3E2F4),
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      onPressed: onpress,
    );
  }
}

