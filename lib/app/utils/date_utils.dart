import 'package:flutter/material.dart';

abstract class MyDateUtils {
  static Map<int, Map<int, DateTimeRange>> getYearsAndWeeks(int startYear, int endYear) {
    final yearsAndWeeks = <int, Map<int, DateTimeRange>>{};

    for (int year = startYear; year <= endYear; year++) {
      yearsAndWeeks[year] = getWeeksInYear(year);
    }

    return yearsAndWeeks;
  }

  static DateTime _sundayOfWeek(DateTime d) {
    final base = DateTime(d.year, d.month, d.day);
    return base.subtract(Duration(days: base.weekday % 7));
  }

  static Map<int, DateTimeRange> getWeeksInYear(int year) {
    final weeks = <int, DateTimeRange>{};
    final firstWeekStart = _sundayOfWeek(DateTime(year, 1, 1));
    var start = firstWeekStart;
    var weekNumber = 1;
    while (true) {
      final end = start.add(const Duration(days: 6));
      weeks[weekNumber++] = DateTimeRange(start: start, end: end);
      if (end.year > year || (end.year == year && end.month == 12 && end.day == 31)) break;
      start = start.add(const Duration(days: 7));
    }
    return weeks;
  }
}
