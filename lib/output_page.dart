import 'package:bmi_calculator/reusedWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutputPage extends StatelessWidget {
  OutputPage(this.bmi_result, this.interpretation, this.resultText);
  final String bmi_result;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              child: Text('Your Result',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            )),
            Expanded(
                flex: 5,
                child: ReusedWidget(
                    () {},
                    Color(0xFF1D1E33),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          resultText,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          bmi_result,
                          style: TextStyle(
                              fontSize: 100, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          interpretation,
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ))),
            Container(
              margin: const EdgeInsets.only(top: 10),
              color: Color(0xFFEB1555),
              width: double.infinity,
              height: 80.0,
              child: GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: Center(
                  child: Text('Re-calculate BMI',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
