import 'package:intl/intl.dart';

enum Pattern {
  hhmm,
  ddmmm,
  md,
  ddMMMMyyyyHHmm,
  yyyyMMddHHmm,
  yyyyMMddHHmm_JP,
  yyyyMMdd,
  yyyyMMddHHmmss,
  yyyyMMddHHmmss_JP,
  yyyyMM_JP,
  yyyyMM
}

extension PatternExtension on Pattern {
  String get pattern {
    switch (this) {
      case Pattern.hhmm:
        return 'HH:mm';
      case Pattern.ddmmm:
        return 'dd MMM';
      case Pattern.md:
        return 'M/d';
      case Pattern.ddMMMMyyyyHHmm:
        return 'dd MMMM yyyy, HH:mm';
      case Pattern.yyyyMMddHHmm:
        return 'yyyy/MM/dd HH:mm';
      case Pattern.yyyyMMddHHmm_JP:
        return 'yyyy年 MM月 dd日 HH時 mm分';
      case Pattern.yyyyMMdd:
        return 'yyyy年　MM月　dd日';
      case Pattern.yyyyMMddHHmmss:
        return 'yyyy-MM-dd HH:mm:ss';
      case Pattern.yyyyMMddHHmmss_JP:
        return 'yyyy-MM-dd HH:mm:ss';
      case Pattern.yyyyMM_JP:
        return 'yyyy年 MM月';
      case Pattern.yyyyMM:
        return 'yyyy-MM';
      default:
        return '';
    }
  }
}

class DateTimeUtils {
  static DateTime getDateTime(dynamic dateToConvert, {Pattern? pattern}) {
    if (dateToConvert is int) {
      return DateTime.fromMillisecondsSinceEpoch(dateToConvert);
    } else if (dateToConvert is String) {
      return DateFormat(pattern!.pattern).parse(dateToConvert);
    }
    return dateToConvert;
  }

  static String getStringDate(dynamic dateToConvert, Pattern pattern,
      {String? languageCode}) {
    if (dateToConvert == null) {
      return '';
    }
    final dateFormat = DateFormat(pattern.pattern, languageCode);
    if (dateToConvert is int) {
      final datetime = getDateTime(dateToConvert);
      return dateFormat.format(datetime);
    } else if (dateToConvert is DateTime) {
      return dateFormat.format(dateToConvert);
    }
    return '';
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
            .difference(DateTime(now.year, now.month, now.day))
            .inDays ==
        0;
  }
}
