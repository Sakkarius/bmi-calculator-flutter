import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'resultsPage.dart';
import 'calculator_brain.dart';

enum Genders { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Border inactiveCard = Border.all(width: 0.0);
Border activeCard = Border.all(color: Colors.black, width: 4);
Border maleCard = Border.all(width: 0.0);
Border femaleCard = Border.all(width: 0.0);

Genders gender;

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 75;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text('BMI CALCULATOR'),
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          gender = Genders.male;
                        });
                      },
                      cardBorder: gender == Genders.male
                          ? maleCard = activeCard
                          : maleCard = inactiveCard,
                      cardChild: InsideColumns(
                          genderIcon: Icon(FontAwesomeIcons.mars, size: 80),
                          text: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            gender = Genders.female;
                          });
                        },
                        cardBorder: gender == Genders.female
                            ? femaleCard = activeCard
                            : femaleCard = inactiveCard,
                        cardChild: InsideColumns(
                            genderIcon: Icon(FontAwesomeIcons.venus, size: 80),
                            text: 'FEMALE')),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardBorder: activeCard,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kMainTextStyle,
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(height.toString(), style: kSecondaryTextStyle),
                          Text('CM', style: kMainTextStyle)
                        ],
                      ),
                      SliderTheme(
                        data: kSliderTheme,
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 230.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ]),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardBorder: activeCard,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kMainTextStyle,
                          ),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(weight.toString(),
                                  style: kSecondaryTextStyle),
                              Text(
                                'KG',
                                style: kMainTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                stFul: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  stFul: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardBorder: activeCard,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: kMainTextStyle),
                          Text(age.toString(), style: kSecondaryTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                stFul: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                stFul: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: TextButton(
                child: Text(
                  'CALCULATE',
                  style: kMainTextStyle,
                ),
                onPressed: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return resultsPage(
                      bmiResult: calc.calulateBMI(),
                      interpitation: calc.getInterpitation(),
                      resultText: calc.getResults(),
                    );
                  }));
                },
              ),
              color: Colors.black45,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomCointainerHeight,
            )
          ],
        ));
  }
}

class InsideColumns extends StatelessWidget {
  InsideColumns({@required this.genderIcon, this.text});
  final Icon genderIcon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        genderIcon,
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kMainTextStyle,
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.cardChild, this.cardBorder, this.onPress});
  final Function onPress;
  final Widget cardChild;
  final Border cardBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: cardBorder,
          borderRadius: BorderRadius.circular(10),
          color: kPurpleShade,
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.stFul});

  final IconData icon;
  final Function stFul;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(
          icon,
          size: 30,
          color: kPurpleShade,
        ),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
        shape: CircleBorder(),
        fillColor: Colors.black,
        onPressed: () {
          stFul();
        });
  }
}
