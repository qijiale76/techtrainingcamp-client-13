import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  @override
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<ClockPage> {
  static List<int> currentTimeMillis() {
    var t = DateTime.now();
    return [t.year, t.month, t.day, t.hour, t.minute, t.second];
  }

  List<int> _time;
  String time;
  String date;

  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  void parseTime() {
    _time = currentTimeMillis();
    date = _time[0].toString() +
        "/" +
        formatTime(_time[1]) +
        "/" +
        formatTime(_time[2]);
    time = formatTime(_time[3]) +
        ":" +
        formatTime(_time[4]) +
        ":" +
        formatTime(_time[5]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            '$date',
            style: Theme.of(context).textTheme.headline4,
          ),
          new Text(
            '$time',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    parseTime();
    startTimer();
  }

  void startTimer() {
    const period = const Duration(seconds: 1);
    Timer.periodic(period, (timer) {
      setState(() {
        parseTime();
      });
    });
  }
}
