import 'dart:math';

class CalBrain {
  final int height;
  final int weight;
  CalBrain({required this.height, required this.weight});

  double _bmi = 0;
  String calculateBMI() {
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

  String resultText() {
    if (_bmi >= 25) {
      return 'You have a higher then normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower then normal body weight. You can eat a bit more';
    }
  }
}
