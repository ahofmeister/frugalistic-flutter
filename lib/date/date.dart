import 'package:intl/intl.dart';

class Date {
  final DateTime _date;

  Date(int year, int month, int day) : _date = DateTime.utc(year, month, day);

  int get year => _date.year;

  int get month => _date.month;

  int get day => _date.day;

  int get weekday => _date.weekday;

  static Date now() {
    final currentDate = DateTime.now();
    return Date(currentDate.year, currentDate.month, currentDate.day);
  }

  Date update({int? year, int? month, int? day}) =>
      Date(year ?? _date.year, month ?? _date.month, day ?? _date.day);

  Date add({int years = 0, int months = 0, int days = 0}) =>
      Date(_date.year + years, _date.month + months, _date.day + days);

  Date subtract({int years = 0, int months = 0, int days = 0}) =>
      Date(_date.year - years, _date.month - months, _date.day - days);

  Date firstOfMonth() {
    return Date(_date.year, _date.month, 1);
  }

  Date lastOfMonth() {
    final lastDay = DateTime(_date.year, _date.month + 1, 0).day;
    return Date(_date.year, _date.month, lastDay);
  }

  String get weekdayString {
    return DateFormat('EEEE').format(_date);
  }

  String format(String format) {
    return DateFormat(format).format(_date);
  }

  @override
  String toString() {
    var dateString = _date.toString();
    return dateString.substring(0, dateString.indexOf(" "));
  }
}
