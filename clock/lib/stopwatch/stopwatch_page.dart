import 'stopwatch_widget.dart';
import 'package:flutter/material.dart';
import '../utils/my_appbar.dart';


class MyStopwatchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [StopwatchTime()],
        )
    );

  }
}