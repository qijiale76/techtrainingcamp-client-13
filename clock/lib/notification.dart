import 'package:clock/utils/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MyNotification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyNotificationState();

}

class _MyNotificationState extends State<MyNotification> {
  static const mNotificationBar = const MethodChannel(
      "com.example.clock/sendNotification");
  String toPrint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      MyButton(text: "send", callback:
        () async {
      String result = await mNotificationBar.invokeMethod("timesup");
      if(result != null){
        setState(() {
          toPrint = result;
        });
      }
    },),
        Text("$toPrint")
      ],
    );
  }
}