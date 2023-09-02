import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_text.dart';
import 'results_page.dart';
import 'calculater_brain.dart';

const Color value = Color(0xff1d1e33);
const value2 = Color(0xff111328);

const kLargeFontStyle = TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum GenderType {
  male,
  female,
}

GenderType? selectedColor;

int height = 180;
int weight = 60;
int age = 20;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: new ReusableCard(
                tapFunction: () {
                  setState(() {
                    selectedColor = GenderType.male;
                  });
                },
                colour: selectedColor == GenderType.male ? value : value2,
                cardChild: IconandTextCard(FontAwesomeIcons.mars, 'MALE'),
              )),
              Expanded(
                  child: new ReusableCard(
                tapFunction: () {
                  setState(() {
                    selectedColor = GenderType.female;
                  });
                },
                colour: selectedColor == GenderType.female ? value : value2,
                cardChild: IconandTextCard(FontAwesomeIcons.venus, 'FEMALE'),
              ))
            ],
          )),
          Expanded(
              child: new ReusableCard(
                  colour: value,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          thumbColor: Color(0xffeb1555),
                          overlayColor: Color(0x29eb1555),
                          activeTrackColor: Colors.white,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          inactiveColor: Color(0xff8d8e98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ))),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: new ReusableCard(
                colour: value,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: new ReusableCard(
                colour: value,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
          BottomButton(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    ResultText: calc.getResult(),
                    interpretor: calc.getInterPretation(),
                  )));
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final void Function()? onTap;
  final String? buttonTitle;

  BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle.toString(),
          style: kLargeFontStyle,
        )),
        color: Color(0xffeb1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, this.onPressed});

  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
