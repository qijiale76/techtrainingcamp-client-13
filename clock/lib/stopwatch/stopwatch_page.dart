import 'package:clock/utils/color_set.dart';

import 'stopwatch_widget.dart';
import 'package:flutter/material.dart';


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