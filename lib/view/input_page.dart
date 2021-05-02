import 'package:bmi_calculator/constants/color_constants.dart';
import 'package:bmi_calculator/custom_widgets/appbar_widget.dart';
import 'package:bmi_calculator/custom_widgets/reusable_button.dart';
import 'package:bmi_calculator/custom_widgets/reusable_card.dart';
import 'package:bmi_calculator/custom_widgets/round_icon_button_widget.dart';
import 'package:bmi_calculator/enums/enum_gender.dart';
import 'package:bmi_calculator/styles/text_styles.dart';
import 'package:bmi_calculator/utils/bmi_calculator_logic.dart';
import 'package:bmi_calculator/view/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_constants.dart';
import '../custom_widgets/icon_content_widget.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _mSelectedGender;
  int _mHeight = 180;
  int _mWeight = 60;
  int _mAge = 25;
  String _mFeetInches = '  / 5\'11\"';

  String centimeterToFeet(int centimeters) {
    int feetPart = 0;
    int inchPart = 0;

    if (centimeters > 0) {
      feetPart = (centimeters / 30.48).floor();
      inchPart = ((centimeters / 2.54) - (feetPart * 12)).ceil();

      print('Feet : $feetPart, Inch: $inchPart');
    }
    return '  / $feetPart\'$inchPart\"';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //***** first row
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        _mSelectedGender = Gender.MALE;
                      });
                    },
                    mColor: _mSelectedGender == Gender.MALE
                        ? kActiveContainerColor
                        : kInActiveContainerColor,
                    cardChild: IconContentWidget(
                      mGenderLabel: 'MALE',
                      mIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        _mSelectedGender = Gender.FEMALE;
                      });
                    },
                    mColor: _mSelectedGender == Gender.FEMALE
                        ? kActiveContainerColor
                        : kInActiveContainerColor,
                    cardChild: IconContentWidget(
                      mGenderLabel: 'FEMALE',
                      mIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //***** second row
          Expanded(
            child: ReusableCard(
              mColor: kActiveContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelRegularTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        _mHeight.toString(),
                        style: kLabelHeader1TextStyle,
                      ),
                      Text(
                        ' cm',
                        style: kLabelRegularTextStyle,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        _mFeetInches,
                        style: kLabelHeader3TextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kActiveSliderColor,
                      inactiveTrackColor: kInActiveSliderColor,
                      overlayColor: kSliderOverlayColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: kCustomButtonColor,
                    ),
                    child: Slider(
                      value: _mHeight.toDouble(),
                      min: kSliderMinHeight,
                      max: kSliderMaxHeight,
                      divisions: 100,
                      onChanged: (double newValue) {
                        setState(() {
                          _mHeight = newValue.round();
                          _mFeetInches = centimeterToFeet(_mHeight);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          //***** third row
          Expanded(
            child: Row(
              children: <Widget>[
                //weight
                Expanded(
                  child: ReusableCard(
                    mColor: kActiveContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelRegularTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              _mWeight.toString(),
                              style: kLabelHeader1TextStyle,
                            ),
                            Text(
                              ' kg',
                              style: kLabelRegularTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              mIcon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  _mWeight = _mWeight > 0 ? _mWeight - 1 : 0;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              mIcon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  _mWeight =
                                      _mWeight < 500 ? _mWeight + 1 : 500;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                //age
                Expanded(
                  child: ReusableCard(
                    mColor: kActiveContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelRegularTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              _mAge.toString(),
                              style: kLabelHeader1TextStyle,
                            ),
                            Text(
                              ' Yrs',
                              style: kLabelRegularTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              mIcon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  _mAge = _mAge > 0 ? _mAge - 1 : 0;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              mIcon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  _mAge = _mAge < 120 ? _mAge + 1 : 120;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //***** Fourth Row - button
          ReusableButtonWidget(
              buttonText: 'CALCULATE',
              onTap: () {
                BmiCalculatorLogic calc =
                    BmiCalculatorLogic(height: _mHeight, weight: _mWeight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.calculateBmi(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
