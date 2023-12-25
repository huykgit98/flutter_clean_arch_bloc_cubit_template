import 'package:intl/intl.dart';
import 'package:flutter_starter/config/constants/app_constants.dart';

class DateTimeHelper {
  DateTimeHelper._();

  static toShortDayString(String dateString) {
    return toCustomFormatString(AppDatetimeFormat.shortDay, dateString);
  }

  static toFullDayString(String dateString) {
    return toCustomFormatString(AppDatetimeFormat.fullDay, dateString);
  }

  static toCustomFormatString(String format, String dateString) {
    if (dateString == "") return "";
    var date = DateFormat("dd/MM/yyyy").parse(dateString);
    final DateFormat formatter = DateFormat(format);
    final String formatted = formatter.format(date);
    return formatted;
  }

  static getShortToday() {
    DateTime now = DateTime.now();
    return DateFormat(AppDatetimeFormat.shortDay).format(now);
  }

  static getFullToday() {
    DateTime now = DateTime.now();
    return DateFormat(AppDatetimeFormat.fullDay).format(now);
  }

  static bool checkInputDateSameToday(DateTime inputDate) {
    final inputDateStr = DateFormat(AppDatetimeFormat.shortDay).format(inputDate);
    final todayStr = getShortToday();
    return inputDateStr == todayStr;
  }
}
