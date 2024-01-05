import 'package:bmi_calculator/utilities/constant.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';


class ResultScreen extends StatefulWidget {
  final String bmi;
  final String result;
  final String resultText;
  const ResultScreen({
    Key? key,
    required this.bmi,
    required this.result,
    required this.resultText,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int bmi = 130;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _results(),
          _calculateButton(),
        ],
      ),
    );
  }

  Widget _title() {
    return Expanded(
      child: Center(
        child: Text(
          'Your Results',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _results() {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ReusableCard(
          radius: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.result,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.bmi,
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.resultText,
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _calculateButton() {
    return Expanded(
      child: CalCulateButton(
        title: 'RE-CALCULATE',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
