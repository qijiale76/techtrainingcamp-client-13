import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class SelectArea extends StatelessWidget {
  Duration _time;
  final ValueChanged<Duration> onChanged;
  static const _Notification =
      const MethodChannel("com.example.clock/sendNotification");

  SelectArea({Key key, @required this.onChanged}) : super(key: key);

  void _handleTimerDurationChange() {
    onChanged(_time);
  }

  Duration get time {
    return _time;
  }

  void _vibrate() async {
    _Notification.invokeMethod("vibrate");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(width: 400, height: 200),
      child: CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hms,
        onTimerDurationChanged: (Duration newTimer) {
          _time = newTimer;
          _handleTimerDurationChange();
          _vibrate();
        },
      ),
    );
  }
}
