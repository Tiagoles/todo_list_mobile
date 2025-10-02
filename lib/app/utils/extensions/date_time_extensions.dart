import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime{
  ({int months, int days}) getDifferenceBetweenDates(DateTime endDate){
    int months = 0;
    int days = 0;

    DateTime tempDate = DateTime(year, month, day);
    while (tempDate.isBefore(endDate)) {
      tempDate = DateTime(tempDate.year, tempDate.month + 1, tempDate.day);
      if (tempDate.isBefore(endDate) || tempDate.isAtSameMomentAs(endDate)) {
        months++;
      } else {
        break;
      }
    }

    final DateTime finalDate = DateTime(year, month + months, day);
    days = endDate.difference(finalDate).inDays;

    return (
      months: months,
      days: days
    );
  }

  String format(String format){
    return DateFormat(format, 'pt_BR').format(this);
  }

  bool isSameDay(DateTime other){
    return year == other.year && month == other.month && day == other.day;
  }

  int get weekOfYear {
    DateTime firstDayOfYear = DateTime(year, 1, 1);

    if (firstDayOfYear.weekday != DateTime.sunday) {
      firstDayOfYear = firstDayOfYear.subtract(Duration(days: firstDayOfYear.weekday % 7));
    }

    final currentWeekStart = weekday == DateTime.sunday
        ? this
        : subtract(Duration(days: weekday % 7));

    final daysDifference = currentWeekStart.difference(firstDayOfYear).inDays;

    return (daysDifference / 7).floor() + 1;
  }

}