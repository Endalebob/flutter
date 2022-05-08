import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(this.height, this.weight);
  late int height;
  late double weight;

  double wigh() {
    return (weight / pow(height / 100, 2));
  }

  String get_bmi() {
    return wigh().toStringAsFixed(1);
  }

  String get_message() {
    if (wigh() > 25) {
      return 'Overweight';
    } else if (wigh() > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String interprete() {
    if (wigh() > 25) {
      return "You have higher than normal body weight. please try to excerise.";
    } else if (wigh() > 18.5) {
      return "You have a normal weight. Good job!";
    } else {
      return "You have a lower body weight. eat abit more.";
    }
  }
}
