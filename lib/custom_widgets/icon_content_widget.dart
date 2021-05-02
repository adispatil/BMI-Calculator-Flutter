import 'package:bmi_calculator/styles/text_styles.dart';
import 'package:flutter/material.dart';

class IconContentWidget extends StatelessWidget {
  IconContentWidget({@required this.mGenderLabel, @required this.mIcon});

  final String mGenderLabel;
  final IconData mIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          mIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          mGenderLabel,
          style: kLabelRegularTextStyle,
        ),
      ],
    );
  }
}