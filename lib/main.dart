import 'package:bmi_calculator/output_page.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF090C22),
          primaryColor: Color(0xFF090C22)),
      home: InputPage(),
      routes: {'/input': (context) => InputPage()},
    );
  }
}
