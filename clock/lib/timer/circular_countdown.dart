import 'package:clock/timer/circular_progress.dart';
import 'package:clock/timer/my_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularCountdown extends StatefulWidget{
  final MyTimer myTimer;

  const CircularCountdown({Key key, this.myTimer}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CircularCountdownState();
}

class _CircularCountdownState extends State<CircularCountdown> with TickerProviderStateMixin{

  AnimationController _animationController;


  @override
  void initState(){
    super.initState();
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: widget.myTimer.totalSeconds));
    _animationController.value = widget.myTimer.passSeconds / widget.myTimer.totalSeconds;
    _animationController.forward();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) {
        return  GradientCircularProgressIndicator(
          radius: 130,
          strokeCapRound: true,
          strokeWidth: 5,
          colors: [Colors.blue, Colors.blue],
          value: _animationController.value,
        );
      },
    );
  }

}