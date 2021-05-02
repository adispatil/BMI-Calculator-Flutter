import 'package:bmi_calculator/constants/color_constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.mIcon, this.onPress});

  final IconData mIcon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(mIcon),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kFloatingActionBackgroundColor,
    );
  }
}
