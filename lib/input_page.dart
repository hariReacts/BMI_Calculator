import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/output_page.dart';
import 'package:bmi_calculator/reusedWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gendercolumn.dart';

const activeCardColour = Color(0xFF1D1E33);
const bottomContainerColour = Color(0xFFEB1555);
const inactiveCardColur = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 75;
  int age = 18;
  Color maleCardColor = inactiveCardColur;
  Color femaleCardColor = inactiveCardColur;
  // 1 For Male 2 For Female
  void updateColor(Gender g) {
    if (g == Gender.male) {
      if (maleCardColor == inactiveCardColur) {
        maleCardColor = activeCardColour;
        femaleCardColor = inactiveCardColur;
      } else {
        maleCardColor = inactiveCardColur;
      }
    } else {
      if (femaleCardColor == inactiveCardColur) {
        femaleCardColor = activeCardColour;
        maleCardColor = inactiveCardColur;
      } else {
        femaleCardColor = inactiveCardColur;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Calculator calc = Calculator(height, weight);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusedWidget(() {
                    setState(() {
                      updateColor(Gender.male);
                    });
                  }, maleCardColor,
                      GenderColumn(FontAwesomeIcons.mars, 'MALE')),
                ),
                Expanded(
                  child: ReusedWidget(() {
                    setState(() {
                      updateColor(Gender.female);
                    });
                  }, femaleCardColor,
                      GenderColumn(FontAwesomeIcons.venus, 'FEMALE')),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusedWidget(
                () {},
                activeCardColour,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HEIGHT',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF8D8E98))),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(),
                              style: const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w900)),
                          const Text('cm',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFF8D8E98)))
                        ]),
                    SliderTheme(
                      data: const SliderThemeData(
                        activeTrackColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayColor: Color(0x29EB1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        trackHeight: 1,
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        activeColor: Colors.white,
                        value: height.toDouble(),
                        thumbColor: bottomContainerColour,
                        max: 220,
                        min: 120,
                        divisions: 100,
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusedWidget(
                      () {},
                      activeCardColour,
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF8D8E98))),
                            Text(weight.toString(),
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.w900)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    Icons.remove,
                                    () => setState(() {
                                          weight = weight - 1;
                                        })),
                                SizedBox(width: 20.0, height: 10.0),
                                RoundIconButton(
                                    Icons.add,
                                    () => setState(() {
                                          weight = weight + 1;
                                        }))
                              ],
                            )
                          ])),
                ),
                Expanded(
                    child: ReusedWidget(
                        () {},
                        activeCardColour,
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('AGE',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFF8D8E98))),
                              Text(age.toString(),
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w900)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                      Icons.remove,
                                      () => setState(() {
                                            age = age - 1;
                                          })),
                                  SizedBox(width: 20.0, height: 10.0),
                                  RoundIconButton(
                                      Icons.add,
                                      () => setState(() {
                                            age = age + 1;
                                          }))
                                ],
                              )
                            ]))),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            color: bottomContainerColour,
            width: double.infinity,
            height: 80.0,
            child: GestureDetector(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OutputPage(calc.calculateBMI(),
                            calc.getInterpretation(), calc.getResults())))
              },
              child: Center(
                child: Text('CALCULATE BMI',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(this.icon, this.onPressed);
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: 40.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
