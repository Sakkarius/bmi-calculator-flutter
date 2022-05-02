import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});

  final int height;
  final int weight;

  double _bmi;

  String calulateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpitation() {
    if (_bmi >= 25) {
      return 'Your BMI is too high. You should eat less.';
    } else if (_bmi > 18.5) {
      return 'You have normal bodyweight. Good Job!';
    } else {
      return 'You have lower than normal bodyweight. You can eat a bit more';
    }
  }
}
