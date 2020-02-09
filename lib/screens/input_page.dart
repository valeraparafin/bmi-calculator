import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constans.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected;
  int height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                    color: genderSelected == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardChildContent(
                      icontext: kMaleText,
                      icon: kMaleIcon,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                    color: genderSelected == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardChildContent(
                      icontext: kFemaleText,
                      icon: kFemaleIcon,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 5.0),
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kLabelNumber,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: Color(0xFFFFEB1555),
                              overlayColor: Color(0x29EB11555),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF8D8E98),
                              thumbShape: RoundSliderThumbShape(
                                  disabledThumbRadius: 15.0),
                              overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 22.0)),
                          child: Slider(
                            min: 120.0,
                            max: 220.0,
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kLabelNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              onDoubleTap: () {
                                setState(() {
                                  weight -= 2;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            RoundIconButton(
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              onDoubleTap: () {
                                setState(() {
                                  weight += 2;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kLabelNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                              onDoubleTap: () {
                                setState(() {
                                  age -= 2;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            RoundIconButton(
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                              onDoubleTap: () {
                                setState(() {
                                  age += 2;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              constraints:
              BoxConstraints(maxHeight: 60.0, maxWidth: double.infinity),
              child: BottomButton(
                buttonText: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calculator = CalculatorBrain(
                      height: height, weight: weight);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          Results(
                            bmiResult:calculator.calculateBMI(),
                            resultText: calculator.getResults(),
                            description: calculator.getDescription(),
                          )));
                },
              ),
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              height: kBottomContainerHeight),
        ],
      ),
    );
  }
}



