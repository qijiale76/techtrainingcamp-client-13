import 'dart:async';

import 'package:clock/utils/time_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MyTimer{
  Timer _timer;
  int _counts = 0;
  int _totalSeconds = 0;
  var _isPause = false;
  var _isRunning = false;
  static const _Notification = const MethodChannel(
      "com.example.clock/sendNotification");
  VoidCallback _callback;

  void start(int counts){
    _counts = counts;
    _totalSeconds = counts;
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(_counts > 0 && !_isPause){
        _counts--;
      }else if (_counts > 0 && _isPause)
      {
        return;
      }
      else{
        sendNotification(_totalSeconds >= 3600? TimerFormatter.hourMinSec(_totalSeconds) : TimerFormatter.minSec(_totalSeconds));
        timer.cancel();
        timer = null;
        _isRunning = false;
        _callback();
      }
    });
  }

  void sendNotification(String content) async {
    Map<String, String> map = {
      "content": content
    };
    _Notification.invokeMethod("timesup", map);
  }

  void pause(){
    if(_isPause){
      _isPause = false;
    }
    else{
      _isPause = true;
    }
  }

  void cancel(){
    if(_timer != null) {
      _counts = 0;
      _timer.cancel();
      _timer = null;
      _isRunning = false;
    }
  }

  bool get isRunning =>_isRunning;

  bool get isPause => _isPause;

  int get restSenconds => _counts;

  set setCallback(VoidCallback callback){
    _callback = callback;
  }

}