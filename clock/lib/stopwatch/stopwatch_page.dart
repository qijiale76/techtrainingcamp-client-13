import 'stopwatch_time.dart';
import 'package:flutter/material.dart';
import '../utils/my_appbar.dart';

class MyStopwatchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_MyStopwatchState();

}

class _MyStopwatchState extends State<MyStopwatchPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Stopwatch"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [StopwatchTime()],
        )
    );

  }


}