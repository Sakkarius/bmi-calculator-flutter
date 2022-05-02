import 'package:flutter/material.dart';
import 'input_page.dart';
import 'resultsPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              elevation: 0.00,
              backgroundColor: Color(0xFFDB6ADC),
              titleTextStyle: TextStyle(
                fontFamily: 'RobotoCondensed',
                color: Colors.black87,
                fontSize: 35.0,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              )),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Color(0xFF834084)),
          scaffoldBackgroundColor: Color(0xFFDB6ADC)),
      initialRoute: 'startPage',
      routes: {
        'startPage': (context) => InputPage(),
        'resultsPage': (context) => resultsPage(),
      },
    );
  }
}
