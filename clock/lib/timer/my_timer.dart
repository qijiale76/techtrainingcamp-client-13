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
  VoidCallback _callbackEnd;
  VoidCallback _callbackPause;

  void start(int counts){
    if(counts != 0) {
      _counts = counts * 10;
      _totalSeconds = counts * 10;
      _isRunning = true;
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        if (_counts > 0 && !_isPause) {
          _counts -= 1;
        } else if (_counts > 0 && _isPause) {
          return;
        }
        else {
          sendNotification(_totalSeconds/10 >= 3600 ?
          TimerFormatter.hourMinSec((_totalSeconds/10).truncate()) : TimerFormatter.minSec(
              (_totalSeconds/10).truncate()));
          timer.cancel();
          timer = null;
          _isRunning = false;
          _callbackEnd();
        }
      });
    }
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
    _callbackPause();
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

  int get restSeconds => (_counts/10).truncate();

  int get totalSeconds => (_totalSeconds/10).truncate();

  int get passSeconds => ((_totalSeconds - _counts)/10).truncate();

  set setCallbackEnd(VoidCallback callback){
    _callbackEnd = callback;
  }

  set setCallBackPause(VoidCallback callback){
    _callbackPause = callback;
  }

}