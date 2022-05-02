import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'calculator_brain.dart';

class resultsPage extends StatelessWidget {
  resultsPage({this.bmiResult, this.interpitation, this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpitation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('RESULTS', style: kMainTextStyle)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(resultText, style: kMainTextStyle),
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                          fontSize: 120.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          interpitation,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              cardBorder: activeCard,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: TextButton(
          child: Text(
            'CHANGE SETTINGS',
            style: kMainTextStyle,
          ),
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) {
              return InputPage();
            }));
          },
        ),
        color: Colors.black45,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomCointainerHeight,
      ),
    );
  }
}
