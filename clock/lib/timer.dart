import 'package:flutter/cupertino.dart';

class TimerPage extends StatefulWidget {
  @override
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'You have now at timer page',
          ),
        ],
      ),
    );
  }
}
