import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/inputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff080C22),
        primaryColor: Color(0xff080C22),
      ),
      home: InputPage(),
    );
  }
}
