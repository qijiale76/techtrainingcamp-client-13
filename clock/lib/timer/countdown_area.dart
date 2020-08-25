import 'dart:async';

import 'package:clock/timer/circular_countdown.dart';
import 'package:clock/timer/circular_progress.dart';
import 'package:clock/timer/my_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/time_formatter.dart';


class CountdownArea extends StatefulWidget{
  final MyTimer myTimer;

  CountdownArea({Key key, this.myTimer}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountdownAreaState();
}



class _CountdownAreaState extends State<CountdownArea> with TickerProviderStateMixin{

  Timer _timer;
  
  @override
  void initState(){
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 500), _update);
  }

  void _update(Timer timer){
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String toPrint = widget.myTimer.restSenconds >= 3600 ? TimerFormatter.hourMinSec(widget.myTimer.restSenconds) : TimerFormatter.minSec(widget.myTimer.restSenconds);
    TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 50);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
//          color: Colors.red,
          child: CircularCountdown(myTimer: widget.myTimer)
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(toPrint, style:textStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_alarm, color: Colors.black38,),
                  Text(widget.myTimer.totalSeconds >= 3600 ? TimerFormatter.hourMinSec(widget.myTimer.totalSeconds) : TimerFormatter.minSec(widget.myTimer.totalSeconds), style: TextStyle(color: Colors.black38))
                ],
              )
            ],
          ),
        )
      ],
    );
//    return Text(toPrint, style: textStyle);
  }

}