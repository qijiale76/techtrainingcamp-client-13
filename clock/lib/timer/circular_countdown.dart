import 'package:clock/timer/circular_progress.dart';
import 'package:clock/timer/my_timer.dart';
import 'package:clock/utils/color_set.dart';
import 'package:clock/utils/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/color_set.dart';

class CircularCountdown extends StatefulWidget{
  final MyTimer myTimer;

  const CircularCountdown({Key key, this.myTimer}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CircularCountdownState();
}

class _CircularCountdownState extends State<CircularCountdown> with TickerProviderStateMixin{

  AnimationController _animationController;
  bool _isPlaying = true;

  @override
  void initState(){
    super.initState();
    widget.myTimer.setCallBackPause = _animationPause;
    widget.myTimer.setCallBackRestart = _animationRestart;
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: widget.myTimer.totalSeconds));
    _animationController.value = widget.myTimer.passSeconds / widget.myTimer.totalSeconds;
    _animationController.forward();
  }

  void _animationPause(){
    _animationController.stop();
  }

  void _animationRestart(){
    _animationController.forward();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) {
        return  GradientCircularProgressIndicator(
          radius: 130,
          strokeCapRound: true,
          strokeWidth: 5,
          value: _animationController.value,
          colors: [ColorMode.progressBarColor, ColorMode.progressBarColor],
        );
      },
    );
  }

}