import 'dart:async';

import 'package:clock/timer/my_timer.dart';
import 'package:flutter/cupertino.dart';
import '../utils/time_formatter.dart';


class CountdownArea extends StatefulWidget{
  final MyTimer myTimer;

  CountdownArea({Key key, this.myTimer}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountdownAreaState();
}



class _CountdownAreaState extends State<CountdownArea>{

  Timer _timer;

  _CountdownAreaState(){
    _timer = Timer.periodic(Duration(milliseconds: 500), update);
  }

  void update(Timer timer){
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String toPrint = widget.myTimer.restSenconds >= 3600 ? TimerFormatter.hourMinSec(widget.myTimer.restSenconds) : TimerFormatter.minSec(widget.myTimer.restSenconds);
    TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 50);
    return Text(toPrint, style: textStyle);
  }

}