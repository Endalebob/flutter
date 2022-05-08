import 'dart:math';

import 'package:bmi_calculator/result.dart';
import 'package:bmi_calculator/result_calculator.dart';
import 'package:flutter/material.dart';
import 'content.dart';
import 'reusable_file.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int heightRange = 180;
  double weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    click: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    oso: Content(
                      message: 'MALE',
                      ico: FontAwesomeIcons.mars,
                    ),
                    colour: selectedGender == Gender.male ? best : inactiveBest,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    click: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    oso: Content(
                      message: 'FEMALE',
                      ico: FontAwesomeIcons.venus,
                    ),
                    colour:
                        selectedGender == Gender.female ? best : inactiveBest,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              oso: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: styleText,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$heightRange',
                        style: nums,
                      ),
                      Text(
                        'cm',
                        style: styleText,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color.fromARGB(255, 238, 10, 150),
                      overlayColor: Color.fromARGB(80, 238, 10, 150),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    ),
                    child: Slider(
                      inactiveColor: Color.fromARGB(255, 104, 105, 116),
                      min: 110,
                      max: 230,
                      value: heightRange.toDouble(),
                      onChanged: (double newheight) {
                        setState(() {
                          heightRange = newheight.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              colour: best,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    oso: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: styleText,
                        ),
                        Text(
                          "$weight",
                          style: nums,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                weight--;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              FontAwesomeIcons.add,
                              () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: best,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    oso: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: styleText,
                        ),
                        Text(
                          "$age",
                          style: nums,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              FontAwesomeIcons.add,
                              () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: best,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(heightRange, weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Result(calc.get_message(),calc.get_bmi(),calc.interprete());
                  },
                ),
              );
            },
            child: Container(
              height: bottomHeight,
              width: double.infinity,
              color: bottomColor,
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  RoundIconButton(this.icon, this.press);
  final IconData icon;
  VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color.fromARGB(255, 64, 64, 65),
      onPressed: press,
    );
  }
}
