import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

const kTitleTextStyle = TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold);

class ResultsPage extends StatelessWidget {

  final String? ResultText;
  final String? bmiResult;
  final String? interpretor;
  ResultsPage({@required this.bmiResult,@required this.interpretor,@required this.ResultText});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: new ReusableCard(
              colour: value,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ResultText.toString(),
                    style: TextStyle(
                      color: Color(0xff24d876),
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    bmiResult.toString(),
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretor.toString(),
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
