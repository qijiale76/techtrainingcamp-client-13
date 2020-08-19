class TimerFormatter{
  static String minSecMilli(int milliseconds){
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr.$hundredsStr";
  }

  static String hourMinSec(int seconds){
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String secondsStr = (seconds % 60).toString().padLeft(2,'0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String hoursStr = (hours % 24).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  static String minSec(int seconds){
    int minutes = (seconds / 60).truncate();

    String secondsStr = (seconds % 60).toString().padLeft(2,'0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr";
  }

}