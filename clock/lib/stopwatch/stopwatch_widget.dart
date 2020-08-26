import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/time_formatter.dart';
import '../utils/my_button.dart';

class StopwatchTime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StopwatchTime();
}

class _StopwatchTime extends State<StopwatchTime> {
  static final Stopwatch stopwatch = Stopwatch();
  static List<int> record = List<int>();

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
            constraints: BoxConstraints.expand(width: 250, height: 200),
            child: ListView.separated(
                itemBuilder: (BuildContext buildContext, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${record.length - index}',
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.start),
                      Text('${TimerFormatter.minSecMilli(record[index])}',
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.end)
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
                  ? MyButton(
                      icon: Icon(
                        Icons.playlist_add,
                      ),
                      callback: _lap)
                  : MyButton(
                      icon: Icon(
                        Icons.replay,
                      ),
                      callback: _reset),
              stopwatch.isRunning
                  ? MyButton(
                      icon: Icon(
                        Icons.pause,
                      ),
                      callback: _stop)
                  : MyButton(
                      icon: Icon(
                        Icons.play_arrow,
                      ),
                      callback: _start)
            ],
          ),
        ]);
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
      if (record.isEmpty) {
        record.add(stopwatch.elapsedMilliseconds);
      } else {
        record.insert(0, stopwatch.elapsedMilliseconds);
      }
    });
  }

  void dispose() {
    super.dispose();
  }
}

class PrintTime extends StatefulWidget {
  final Stopwatch stopwatch;

  const PrintTime({Key key, this.stopwatch}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrintTimeState();
}

class _PrintTimeState extends State<PrintTime> {
  Timer _timer;
  void update(Timer timer) {
    if (mounted) {
      if (widget.stopwatch.isRunning) {
        setState(() {});
      }
    }
  }

  _PrintTimeState() {
    _timer = Timer.periodic(
        Duration(
          milliseconds: 20,
        ),
        update);
  }
  @override
  Widget build(BuildContext context) {
    String toPrint =
        TimerFormatter.minSecMilli(widget.stopwatch.elapsedMilliseconds);
    return Text(toPrint,
        style: Theme.of(context).textTheme.headline3,
        textAlign: TextAlign.center);
  }
}
