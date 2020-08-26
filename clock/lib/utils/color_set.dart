import 'package:flutter/material.dart';

class ColorSet {
  int lowerBound;

  int upperBound;

  ColorSet(this.dateTime, {this.lowerBound: 7, this.upperBound: 22}) {
    if (dateTime.hour > upperBound || dateTime.hour < lowerBound) {
      _background = Colors.black;
      _headline3 = Colors.white;
      _headline4 = Colors.white54;
      _subtitle = Colors.white54;
      _buttonColor = Colors.amber;
      _progressBarColor = Colors.amber;
      _timePicker = Colors.white;
      _outRingColor = Color(0xFFEAECFF);
      _inRingColor = Color(0xFF444974);
      _centerRingColor = Color(0xFFEAECFF);
      _brushColor = Color(0xFFEAECFF);
    } else {
      _background = Colors.white;
      _headline3 = Colors.black;
      _headline4 = Colors.black38;
      _subtitle = Colors.black38;
      _buttonColor = Colors.blue;
      _progressBarColor = Colors.blue;
      _timePicker = Colors.black;
      _outRingColor = Color(0xFF2D2F33);
      _inRingColor = Colors.white;
      _centerRingColor = Color(0xFF393B40);
      _brushColor = Color(0xFF2D2F33);
    }
  }

  final DateTime dateTime;

  Color _background;

  Color _headline3;

  Color _headline4;

  Color _subtitle;

  Color _buttonColor;

  Color _progressBarColor;

  Color _timePicker;

  Color _outRingColor;

  Color _inRingColor;

  Color _centerRingColor;

  Color _brushColor;

  Color get background => _background;

  Color get headline4 => _headline4;

  Color get headline3 => _headline3;

  Color get subtitle => _subtitle;

  Color get buttonColor => _buttonColor;

  Color get progressBarColor => _progressBarColor;

  Color get timePicker => _timePicker;

  Color get outRingColor => _outRingColor;

  Color get inRingColor => _inRingColor;

  Color get centerRingColor => _centerRingColor;

  Color get brushColor => _brushColor;
}

class ColorMode {
  static ColorSet _colorSet;

  static Color get background => _colorSet.background;

  static Color get headline4 => _colorSet.headline4;

  static Color get headline3 => _colorSet.headline3;

  static Color get subtitle => _colorSet.subtitle;

  static Color get buttonColor => _colorSet.buttonColor;

  static Color get progressBarColor => _colorSet.progressBarColor;

  static Color get timePicker => _colorSet.timePicker;

  static Color get outRingColor => _colorSet.outRingColor;

  static Color get inRingColor => _colorSet.inRingColor;

  static Color get centerRingColor => _colorSet.centerRingColor;

  static Color get brushColor => _colorSet.brushColor;

  static void init({int lowerBound: 7, int upperBound: 22}) {
    _colorSet = ColorSet(DateTime.now(),
        lowerBound: lowerBound, upperBound: upperBound);
  }
}
