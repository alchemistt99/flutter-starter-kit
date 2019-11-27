import 'package:intl/intl.dart';

String unixTimeStampToDateTime(int millisecond) {
  var format = DateFormat('EEEE, dd MMMM yyyy HH:mm', 'id');
  var dateTimeString = format.format(DateTime.fromMillisecondsSinceEpoch(millisecond * 1000));

  return dateTimeString;
}

String unixTimeStampToDate(int millisecond) {
  var format = DateFormat.yMMMMEEEEd('id');
  var dateString = format.format(DateTime.fromMillisecondsSinceEpoch(millisecond * 1000));

  return dateString;
}
