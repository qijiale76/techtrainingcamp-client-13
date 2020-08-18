import 'package:flutter/cupertino.dart';

class ClockPage extends StatefulWidget {
  @override
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'You have now at clock page',
          ),
        ],
      ),
    );
  }
}
