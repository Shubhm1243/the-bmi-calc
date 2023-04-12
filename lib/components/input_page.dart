import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screen/IconContent.dart';
import '../screen/reusableContainer.dart';
import '../screen/constants.dart';
import 'result.dart';
import '../screen/bottom_button.dart';
import '../screen/round_icon_button.dart';

enum Genders {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Genders? selectedColor;
  int height = 180;
  int weight = 60;
  int age = 20;


  // Color maleColor = inactiveColor;
  // Color femaleColor = inactiveColor;
  //
  //
  // void changeButtonColor(Genders selectedGender){
  //   setState(() {
  //     if(selectedGender == Genders.male){
  //       if(maleColor == inactiveColor){
  //         maleColor = activeColor;
  //         femaleColor = inactiveColor;
  //       }
  //       else{
  //         maleColor = inactiveColor;
  //       }
  //     }
  //     if(selectedGender == Genders.female){
  //       if(femaleColor == inactiveColor){
  //         femaleColor = activeColor;
  //         maleColor = inactiveColor;
  //       }
  //       else{
  //         femaleColor = inactiveColor;
  //       }
  //     }
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    double feet = height*0.0328084;
    int feetfloor = feet.floor();
    double inch = (height / 2.54) % 12;

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: reuseableContainer(
                    onPress: () {
                      setState(() {
                        selectedColor = Genders.male;
                      });
                    },
                    containerchild: IconContent(
                      icons: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    colour: selectedColor == Genders.male
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                ),
                Expanded(
                  child: reuseableContainer(
                    onPress: () {
                      setState(() {
                        selectedColor = Genders.female;
                      });
                    },
                    containerchild: IconContent(
                      icons: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    colour: selectedColor == Genders.female
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                )
              ],
            )),
            Expanded(
              child: reuseableContainer(
                containerchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(width: 15),
                        Text(feetfloor.toStringAsFixed(0),style: kNumberTextStyle,),
                        Text('ft', style: kLabelTextStyle,),
                        Text(inch.toStringAsFixed(0),style: kNumberTextStyle,),
                        Text('inch',style: kLabelTextStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 60,
                          max: 240,
                          activeColor: Color(0xFFEA4C89),
                          inactiveColor: Color(0xFFFAABDA),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
                colour: Color(0xFFCCCBEE),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: reuseableContainer(
                    containerchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text('kg(s)',style: kLabelTextStyle,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: Color(0xFFCCCBEE),
                  ),
                ),
                Expanded(
                  child: reuseableContainer(
                    containerchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: Color(0xFFCCCBEE),
                  ),
                ),
              ],
            )),
            bottomButton(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Result(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  }));
                }),
          ],
        ));
  }
}
