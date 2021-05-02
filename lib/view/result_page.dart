import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/constants/color_constants.dart';
import 'package:bmi_calculator/custom_widgets/appbar_widget.dart';
import 'package:bmi_calculator/custom_widgets/reusable_button.dart';
import 'package:bmi_calculator/custom_widgets/reusable_card.dart';
import 'package:bmi_calculator/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kLabelHeader1TextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kLabelResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kLabelBmiScoreTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kLabelHeader4TextStyle,
                  ),
                ],
              ),
              mColor: kActiveContainerColor,
            ),
          ),
          Expanded(
            child: ReusableButtonWidget(
              buttonText: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
