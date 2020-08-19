import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/time_formatter.dart';

class StopwatchTime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StopwatchTime();

}

class _StopwatchTime extends State<StopwatchTime> {
  Stopwatch stopwatch = Stopwatch();
  List<int> record = List<int>();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: PrintTime(stopwatch: stopwatch),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 100, 0, 100),
            constraints: BoxConstraints.expand(
                width: 250,
                height: 200
            ),
            child: ListView.separated(
                itemBuilder: (BuildContext buildContext, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${record.length - index}', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                      Text('${TimerFormatter.minSecMilli(record[index])}', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.end)
                    ],
                  );
                },
                separatorBuilder: (BuildContext buildContext, int index) {
                  return Divider(color: Colors.transparent);
                },
                itemCount: record.length),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              stopwatch.isRunning
                  ? MyButton(Icon(Icons.playlist_add, size: 45), _lap)
                  : MyButton(Icon(Icons.replay, size: 45), _reset),
              stopwatch.isRunning
                  ? MyButton(Icon(Icons.pause, size: 45), _stop)
                  : MyButton(Icon(Icons.play_arrow, size: 50), _start)
            ],
          ),
        ]
    );
  }

  void _start() {
    setState(() {
      stopwatch.start();
    });
  }

  void _reset() {
    setState(() {
      stopwatch.reset();
      record.clear();
    });
  }

  void _stop() {
    setState(() {
      stopwatch.stop();
    });
  }

  void _lap() {
    setState(() {
      if(record.isEmpty){
        record.add(stopwatch.elapsedMilliseconds);
      }else {
        record.insert(0, stopwatch.elapsedMilliseconds);
      }
    });
  }

  void dispose(){
    super.dispose();
  }

}

class PrintTime extends StatefulWidget {
  final Stopwatch stopwatch;

  const PrintTime({Key key, this.stopwatch}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrintTimeState(stopwatch);
}

class _PrintTimeState extends State<PrintTime> {
  Timer _timer;
  final Stopwatch stopwatch;

  void update(Timer timer) {
    if(mounted){
      if (stopwatch.isRunning) {
        setState(() {

        });
      }
    }
  }

  _PrintTimeState(this.stopwatch) {
    _timer = Timer.periodic(Duration(milliseconds: 20,), update);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0);
    String toPrint = TimerFormatter.minSecMilli(
        stopwatch.elapsedMilliseconds);
    return Text(toPrint, style: textStyle, textAlign: TextAlign.center);
  }

}

class MyButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback callback;

  MyButton(this.icon, this.callback);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: icon,
      onPressed: callback,
    );
  }
}
