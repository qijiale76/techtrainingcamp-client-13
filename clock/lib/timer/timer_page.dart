import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'timer_widget.dart';

class MyTimerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [MyTimerWidget()]
      )
    );
  }

}