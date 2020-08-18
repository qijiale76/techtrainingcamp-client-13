import 'package:flutter/cupertino.dart';

class WorldPage extends StatefulWidget {
  @override
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<WorldPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'You are now at world time page',
          ),
        ],
      ),
    );
  }
}
