import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icons.dart';
import 'package:bmi_calculator/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/IconButton.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff080C22),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male? kActiveCardColour : kInactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          text: "MALE",
                        )
                      )
                  ),
                  Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                      colour: selectedGender == Gender.female? kActiveCardColour : kInactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          text: "FEMALE"))
                  ),
                ],
              )
          ),
          Expanded(
              child: ReusableCard(
                colour: Color(0xff1d1e33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT", style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(), style:kNumberTextStyle),
                        Text(
                          "CM", )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                        thumbColor: Color(0xffEB1555),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        inactiveTrackColor: Color(0xff8d8e98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                        colour: Color(0xff1d1e33),
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "WEIGHT",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  function: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  function: () { setState(() {
                                    weight++;
                                  });
                                  }
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                  Expanded(
                      child: ReusableCard(
                        colour: Color(0xff1d1e33),
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "AGE",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  function: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  function: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            ),

                          ],
                        ),
                      )
                  ),
                ],
              )
          ),
          BottomButton(text: "CALCULATE", onTap: () {
            setState(() {
              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResults: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            });


          },)
        ],
      ),

    );
  }
}

