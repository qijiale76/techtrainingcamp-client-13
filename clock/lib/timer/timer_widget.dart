import 'dart:async';
import 'package:clock/timer/countdown_area.dart';
import 'package:flutter/material.dart';
import 'select_area.dart';
import 'package:flutter/cupertino.dart';
import 'my_timer.dart';
import '../utils/my_button.dart';

class MyTimerWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyTimerWidgetState();
}

class _MyTimerWidgetState extends State<MyTimerWidget>{
  static MyTimer myTimer = MyTimer();
  Duration time;

  void onTimeDurationChanged(Duration duration){
    time = duration;
  }

  void _start(){
    if(mounted){
      setState(() {
        if(time != null) {
          myTimer.start(time.inSeconds);
        }
      });
    }
  }

  void _pause(){
    if(mounted){
      setState(() {
        myTimer.pause();
      });
    }
  }

  void _cancel(){
    if(mounted){
      setState(() {
        myTimer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          child:  myTimer.isRunning? CountdownArea(myTimer: myTimer) : SelectArea(onChanged: onTimeDurationChanged)
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyButton(text: "Cancel", callback: _cancel,),
            myTimer.isRunning ?
            myTimer.isPause ?
            MyButton(text: "Pause", callback: _pause, color: Colors.red) : MyButton(text: "Pause", callback: _pause):
            MyButton(text: "Start", callback: _start,)
          ],
        ),
      ],
    );
  }

}