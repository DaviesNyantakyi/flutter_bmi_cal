import 'package:bmi_calculator/models/calculator_brain.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/utilities/constant.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:bmi_calculator/widgets/genderCard.dart';
import 'package:bmi_calculator/widgets/weight_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/reusable_card.dart';

enum Gender { Male, Female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int height = 130;
  int age = 24;
  int weight = 170;

  String selectedGender = 'male';
  Color maleCardColor = kGreyBlue;
  Color femaleCardColor = kGreyBlue;

  // Toggles card colors based on the provided gender.
  void changeColor({required Gender gender}) {
    if (gender == Gender.Male) {
      maleCardColor = kPink;
      femaleCardColor = kGreyBlue;
    } else {
      femaleCardColor = kPink;
      maleCardColor = kGreyBlue;
    }
    setState(() {});
  }

  void calculateBMI() {
    CalBrain calBrain = CalBrain(height: height, weight: weight);
    final interpetation = calBrain.resultText();
    final result = calBrain.getResults();
    final bmi = calBrain.calculateBMI();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          bmi: bmi,
          result: result,
          resultText: interpetation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        centerTitle: true,
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _genderCards(),
                SizedBox(height: 8),
                _slider(),
                SizedBox(height: 8),
                _weightAndAgeCards(),
              ],
            ),
          ),
          SizedBox(height: 8),
          _calcualteButton(),
        ],
      ),
    );
  }

  Row _genderCards() {
    return Row(
      children: [
        GenderCard(
          value: 'male',
          backgroundColor: maleCardColor,
          onTap: () => changeColor(gender: Gender.Male),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.mars,
                size: 48,
              ),
              SizedBox(height: kCardSpacing),
              Text(
                'Male',
                style: TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
        SizedBox(width: 8),
        GenderCard(
          value: 'female',
          backgroundColor: femaleCardColor,
          onTap: () => changeColor(gender: Gender.Female),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.venus,
                size: 48,
              ),
              SizedBox(height: kCardSpacing),
              Text(
                'Female',
                style: TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
      ],
    );
  }

  ReusableCard _slider() {
    return ReusableCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Height',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                height.toString(),
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              Text(
                'cm',
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              inactiveTrackColor: Colors.white,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
            ),
            child: Slider(
              value: height.toDouble(),
              min: 120,
              max: 220,
              activeColor: kPink,
              onChanged: (value) {
                height = value.round();
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _weightAndAgeCards() {
    return Row(
      children: [
        WeightCard(
          title: 'Age',
          value: age.toString(),
          minButton: () {
            if (age > 0) {
              age--;
              setState(() {});
            }
          },
          plusButton: () {
            age++;
            setState(() {});
          },
        ),
        SizedBox(width: kCardSpacing),
        WeightCard(
          title: 'Weight',
          value: weight.toString(),
          minButton: () {
            if (weight > 0) {
              weight--;
              setState(() {});
            }
          },
          plusButton: () {
            weight++;
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget _calcualteButton() {
    return CalCulateButton(
      title: 'CALCULATE',
      onTap: calculateBMI,
    );
  }
}
