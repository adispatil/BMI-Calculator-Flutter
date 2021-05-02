import 'dart:math';

class BmiCalculatorLogic {
  BmiCalculatorLogic({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 40) {
      return 'Very severely obese';
    } else if (_bmi > 35) {
      return 'Severely obese';
    } else if (_bmi > 30) {
      return 'Moderately obese';
    } else if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal (healthy weight)';
    } else if (_bmi > 16) {
      return 'Underweight';
    } else if (_bmi > 15) {
      return 'Severely underweight';
    } else if (_bmi <= 15) {
      return 'Very severely underweight';
    } else {
      return 'Error...';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher than normal body weight. Try to exercise more. '
          'Follow strict diet...';
    } else if (_bmi >= 18.5) {
      return 'You have normal body weight. Good Job!';
    } else {
      return 'You have lower than normal body weight. You can eat a bit more';
    }
  }
}
