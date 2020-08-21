import 'dart:async';

import 'package:clock/utils/time_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SelectArea extends StatelessWidget{
  Duration _time;
  final ValueChanged<Duration> onChanged;

  SelectArea({Key key, @required this.onChanged}) : super(key: key);

  void _handleTimerDurationChange(){
    onChanged(_time);
  }

  Duration get time{
    return _time;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(width: 400, height: 200),
      child: CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hms,
        onTimerDurationChanged: (Duration newTimer){
          _time = newTimer;
          _handleTimerDurationChange();
        },
      ),
    );
  }
}