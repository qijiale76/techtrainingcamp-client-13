import 'package:flutter/material.dart';

class ColorSet{
  int lowerBound;

  int upperBound;

  ColorSet(this.dateTime, {this.lowerBound: 7, this.upperBound: 22}){
    if(dateTime.hour > upperBound || dateTime.hour < lowerBound){
      _background = Colors.black;
      _headline3 = Colors.white;
      _headline4 = Colors.white54;
      _subtitle = Colors.white54;
      _buttonColor = Colors.amber;
      _progressBarColor = Colors.amber;
      _timePicker = Colors.white;
    }
    else{
      _background = Colors.white;
      _headline3 = Colors.black;
      _headline4 = Colors.black38;
      _subtitle = Colors.black38;
      _buttonColor = Colors.blue;
      _progressBarColor = Colors.blue;
      _timePicker = Colors.black;
    }
  }

  void switchMode(){
    if(_background == Colors.black){
      _background = Colors.white;
      _headline3 = Colors.black;
      _headline4 = Colors.black38;
      _subtitle = Colors.black38;
      _buttonColor = Colors.blue;
      _progressBarColor = Colors.blue;
      _timePicker = Colors.black;
    }
    else{
      _background = Colors.black;
      _headline3 = Colors.white;
      _headline4 = Colors.white54;
      _subtitle = Colors.white54;
      _buttonColor = Colors.amber;
      _progressBarColor = Colors.amber;
      _timePicker = Colors.white;
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

  Color get background => _background;

  Color get headline4 => _headline4;

  Color get headline3 => _headline3;

  Color get subtitle => _subtitle;

  Color get buttonColor => _buttonColor;

  Color get progressBarColor => _progressBarColor;

  Color get timePicker => _timePicker;

}

class ColorMode{
  static ColorSet _colorSet;

  static Color get background => _colorSet.background;

  static Color get headline4 => _colorSet.headline4;

  static Color get headline3 => _colorSet.headline3;

  static Color get subtitle => _colorSet.subtitle;

  static Color get buttonColor => _colorSet.buttonColor;

  static Color get progressBarColor => _colorSet.progressBarColor;

  static Color get timePicker => _colorSet.timePicker;

  static void init({int lowerBound: 7, int upperBound: 22}){
    _colorSet = ColorSet(DateTime.now(), lowerBound: lowerBound, upperBound: upperBound);
  }

  static void switchMode(){
    _colorSet.switchMode();
  }
}