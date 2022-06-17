import 'package:intl/intl.dart';

class CustomDateUtils {

  static String getDateMinusSevenDays() {
    var now = DateTime.now().subtract((Duration(days: 7)));
    var formatter = DateFormat("dd-MMM-yyyy");
    String sevenDaysBackDate = formatter.format(now);
    print("sevenDaysBackDate Date are====>$sevenDaysBackDate");
    return sevenDaysBackDate;
  }

   static String getCurrentDate() {
    var now = DateTime.now();
    var formatter = DateFormat("dd-MMM-yyyy");
    String currentDate = formatter.format(now);
    print("currentDate Date are====>$currentDate");
    return currentDate;
  }
}
