import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constans.dart';

class Results extends StatelessWidget {
  Results({this.bmiResult, this.resultText, this.description});

  final String bmiResult;
  final String resultText;
  final String description;

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
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                constraints: BoxConstraints(
                    maxHeight: 80.0,
                    maxWidth: double.infinity,
                    minWidth: double.infinity),
                child: Text(
                  'Your Results',
                  style: kLabelNumber,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: kLabelResPage,
                    ),
                    Text(
                      bmiResult,
                      textAlign: TextAlign.center,
                      style: kBMITextStyle,
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: kDescrResPage,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                constraints:
                    BoxConstraints(maxHeight: 60.0, maxWidth: double.infinity),
                child: BottomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonText: ('RE-CALCULATE'),
                ),
                color: kBottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 10.0),
                height: kBottomContainerHeight),
          ],
        ));
  }
}
