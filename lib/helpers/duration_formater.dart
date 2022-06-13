class DurationFormater {

  static String getVideoDurationFromMilisecond(int miliseconds) {

    Duration duration = Duration(milliseconds: miliseconds);
    
    String oneDigits(int n) => n.toString().padLeft(1, "0");
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = oneDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    if (duration.inHours != 0) return "${oneDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";

    return "$twoDigitMinutes:$twoDigitSeconds";


  } 

}