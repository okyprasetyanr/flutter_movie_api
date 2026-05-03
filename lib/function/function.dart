import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

String getAPI() {
  return dotenv.env['TMDB_API_KEY']!;
}

String formatDate({required DateTime date, bool? minute}) {
  final useMinute = minute ?? true;
  final pattern = useMinute ? 'dd-MM-yyyy HH:mm:ss' : 'dd-MM-yyyy';
  return DateFormat(pattern).format(date);
}

DateTime parseDate({dynamic date, bool minute = true}) {
  if (date is DateTime) return date;

  final pattern = minute ? 'yyyy-MM-dd HH:mm:ss' : 'yyyy-MM-dd';
  return DateFormat(pattern).parse(date);
}
