import 'dart:async';

class MyTimer{
  Timer _timer;
  int _counts = 0;
  var _isPause = false;
  var _isRunning = false;

  void start(int counts){
    _counts = counts;
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(_counts > 0 && !_isPause){
        _counts--;
      }else if (_counts > 0 && _isPause)
      {
        return;
      }
      else{
        timer.cancel();
        timer = null;
        _isRunning = false;
      }
    });
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

  bool get isRunning{
    return _isRunning;
  }

  bool get isPause{
    return _isPause;
  }

  int get restSenconds{
    return _counts;
  }

}