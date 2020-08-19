import 'package:flutter/cupertino.dart';


class CountdownArea extends StatelessWidget{
  final String restTime;

  const CountdownArea({Key key, this.restTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(width: 400, height: 200),
      child:Text("$restTime", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold), textAlign: TextAlign.center)
    );
  }

}