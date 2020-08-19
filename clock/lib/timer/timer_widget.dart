import 'dart:async';
import 'package:flutter/material.dart';

import 'select_area.dart';
import 'package:flutter/cupertino.dart';
import '../utils/time_formatter.dart';
import 'countdown_area.dart';
import '../utils/my_button.dart';

class MyTimer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer>{
  Timer myTimer;
  int counts = 0;
  SelectArea selectArea = SelectArea();
  bool isPause = false;

  Duration time;

  void _cancel() {
    if (mounted) {
      if (myTimer == null)
        return;
      else {
        setState(() {
          myTimer.cancel();
          myTimer = null;
        });
      }
    }
  }

  void _start(){
    if(mounted){
      setState(() {
        time = selectArea.time;
        if (time == null){
          return;
        }
        counts = time.inSeconds;
        if(counts == 0){
          return;
        }
        if(myTimer != null){
          return;
        }
        isPause = false;
        myTimer = new Timer.periodic(Duration(seconds: 1), (timer) {
          if(mounted){
            setState(() {
              if(counts > 0 && !isPause){
                counts--;
              }else if (counts > 0 && isPause)
              {
                return;
              }
              else{
                myTimer.cancel();
                myTimer = null;
              }
            });
          }
        });
      });
    }
  }

  void _pause(){
    if(mounted){
      setState(() {
        if(isPause){
          isPause = false;
        }else{
          isPause = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: myTimer == null? selectArea:CountdownArea(restTime: "${counts >= 3600 ? TimerFormatter.hourMinSec(counts):TimerFormatter.minSec(counts)}"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyButton(text: "Cancel", callback: _cancel,),
            myTimer == null? MyButton(text: "Start", callback: _start,) : isPause ? MyButton(text: "Pause", callback: _pause, color: Colors.red) : MyButton(text: "Pause", callback: _pause),
          ],
        ),
      ],
    );
  }


}