import 'dart:async';

import 'package:clock/timer/circular_countdown.dart';
import 'package:clock/timer/my_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/time_formatter.dart';

class CountdownArea extends StatefulWidget {
  final MyTimer myTimer;

  CountdownArea({Key key, this.myTimer}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountdownAreaState();
}

class _CountdownAreaState extends State<CountdownArea> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), _update);
  }

  void _update(Timer timer) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String toPrint = widget.myTimer.restSeconds >= 3600
        ? TimerFormatter.hourMinSec(widget.myTimer.restSeconds)
        : TimerFormatter.minSec(widget.myTimer.restSeconds);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
//          color: Colors.red,
            child: CircularCountdown(myTimer: widget.myTimer)),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(toPrint, style: Theme.of(context).textTheme.headline3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_alarm),
                  Text(
                      widget.myTimer.totalSeconds >= 3600
                          ? TimerFormatter.hourMinSec(
                              widget.myTimer.totalSeconds)
                          : TimerFormatter.minSec(widget.myTimer.totalSeconds),
                      style: Theme.of(context).textTheme.subtitle2)
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
