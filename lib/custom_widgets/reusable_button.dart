import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/constants/color_constants.dart';
import 'package:bmi_calculator/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ReusableButtonWidget extends StatelessWidget {
  ReusableButtonWidget({@required this.buttonText, @required this.onTap});

  final String buttonText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kButtonLabelTextStyle,
          ),
        ),
        color: kCustomButtonColor,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}
