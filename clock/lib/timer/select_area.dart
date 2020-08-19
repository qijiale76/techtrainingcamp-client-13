import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SelectArea extends StatelessWidget{
  Duration _time;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(width: 400, height: 200),
      child: CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hms,
        onTimerDurationChanged: (Duration newTimer){
          _time = newTimer;
        },
      ),
    );
  }

  Duration get time{
    return _time;
  }

}

