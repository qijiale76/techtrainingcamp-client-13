import 'package:clock/timer/countdown_area.dart';
import 'package:flutter/material.dart';
import 'select_area.dart';
import 'package:flutter/cupertino.dart';
import 'my_timer.dart';
import '../utils/my_button.dart';

class MyTimerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTimerWidgetState();
}

class _MyTimerWidgetState extends State<MyTimerWidget> {
  static MyTimer myTimer = MyTimer();
  Duration time;

  @override
  void initState() {
    super.initState();
    myTimer.setCallbackEnd = _end;
  }

  void _onTimeDurationChanged(Duration duration) {
    time = duration;
  }

  void _end() {
    if (mounted) {
      setState(() {});
    }
  }

  void _start() {
    if (mounted) {
      setState(() {
        if (time != null) {
          myTimer.start(time.inSeconds);
        }
      });
    }
  }

  void _pause() {
    if (mounted) {
      setState(() {
        myTimer.pause();
      });
    }
  }

  void _cancel() {
    if (mounted) {
      setState(() {
        myTimer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    time = Duration(seconds: 0);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
//          constraints: BoxConstraints.expand(width: 400, height: 400),
            alignment: Alignment.topCenter,
            child: myTimer.isRunning
                ? CountdownArea(myTimer: myTimer)
                : SelectArea(onChanged: _onTimeDurationChanged)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MyButton(
              icon: Icon(
                Icons.stop,
              ),
              callback: _cancel,
            ),
            myTimer.isRunning
                ? myTimer.isPause
                    ? MyButton(
                        icon: Icon(
                          Icons.pause,
                          color: Colors.red,
                          textDirection: TextDirection.ltr,
                        ),
                        callback: _pause)
                    : MyButton(
                        icon: Icon(
                          Icons.pause,
                        ),
                        callback: _pause)
                : MyButton(
                    icon: Icon(
                      Icons.play_arrow,
                    ),
                    callback: _start,
                  )
          ],
        ),
      ],
    );
  }
}
