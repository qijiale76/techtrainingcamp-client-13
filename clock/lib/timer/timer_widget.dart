import 'dart:async';
import 'select_area.dart';
import 'package:flutter/cupertino.dart';
import '../utils/time_formatter.dart';
import 'countdown_area.dart';

class MyTimer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer>{
  Timer myTimer;
  int counts = 0;
  SelectArea selectArea = SelectArea();

  Duration time;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: myTimer == null? selectArea:CountdownArea(restTime: "${counts >= 3600 ? TimerFormatter.hourMinSec(counts):TimerFormatter.minSec(counts)}"),
        ),
        CupertinoButton(
          child: Text("Start"),
          onPressed: (){
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
                myTimer = new Timer.periodic(Duration(seconds: 1), (timer) {
                  if(mounted){
                    setState(() {
                      if(counts > 0){
                        counts--;
                      }else{
                        myTimer.cancel();
                        myTimer = null;
                      }
                    });
                  }
                });
              });
            }
          }
        ),
      ],
    );
  }


}