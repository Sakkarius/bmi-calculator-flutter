import 'package:flutter/material.dart';

const double kBottomCointainerHeight = 60.0;
const kPurpleShade = Color(0xFF834084);
const kMainTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: Colors.black,
    letterSpacing: 1.5);

const kSecondaryTextStyle =
    TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);

const kSliderTheme = SliderThemeData(
  thumbColor: Colors.black,
  activeTrackColor: Colors.black,
  inactiveTrackColor: Colors.black45,
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 26.0),
);
