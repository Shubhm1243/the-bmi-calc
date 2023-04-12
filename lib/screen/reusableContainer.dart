import 'package:flutter/material.dart';

class reuseableContainer extends StatelessWidget {
  reuseableContainer({required this.colour, this.containerchild, this.onPress});

  final Color colour;
  final Widget? containerchild;
  void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15),
        ),
        child: containerchild,
      ),
    );
  }
}