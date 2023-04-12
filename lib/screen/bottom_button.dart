import 'package:flutter/material.dart';
import 'constants.dart';

class bottomButton extends StatelessWidget {
  bottomButton({required this.buttonTitle, required this.onTap});

  String buttonTitle;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButton,
          ),
        ),
        color: Color(0xFFEA4C89),
        height: 100,
        width: double.infinity,
        margin: EdgeInsets.only(top: 2),
      ),
    );
  }
}