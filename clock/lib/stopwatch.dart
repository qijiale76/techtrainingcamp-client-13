import 'package:flutter/cupertino.dart';

class StopwatchPage extends StatefulWidget {
  @override
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<StopwatchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'You have now at stopwatch page',
          ),
        ],
      ),
    );
  }
}
