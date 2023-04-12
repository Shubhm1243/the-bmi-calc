import 'package:bmi_calculator/screen/bottom_button.dart';
import 'package:bmi_calculator/screen/constants.dart';
import 'package:bmi_calculator/screen/reusableContainer.dart';
import 'package:flutter/material.dart';
import '../screen/reusableContainer.dart';

class Result extends StatelessWidget {
  Result({
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reuseableContainer(
              containerchild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize: 100,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Text(
                          'Normal BMI range:',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          '18.4 - 25 kg/m2',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              colour: kInactiveColor,
            ),
          ),
          bottomButton(
              buttonTitle: 'RECALCULATE',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
