import 'package:flutter/cupertino.dart';

class WatchPage extends StatefulWidget {
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<WatchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'You are now at mechanical watch page',
          ),
        ],
      ),
    );
  }
}
