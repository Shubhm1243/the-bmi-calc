import 'package:flutter/material.dart';
import 'constants.dart';


class IconContent extends StatelessWidget {
  IconContent({this.icons,this.label});

  final IconData? icons;
  final String? label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 80,
        ),
        SizedBox(height: 10),
        Text(
          label!,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}


