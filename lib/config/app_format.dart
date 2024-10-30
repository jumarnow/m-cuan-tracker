import 'package:intl/intl.dart';

class AppFormat {
  static String date(String stringDate) {
    // 2022-02-05
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MMM yyyy', 'en_US').format(dateTime); // 5 Feb 2022
  }

  static String dateMonth(String stringDate) {
    // 2022-02-05
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MMM', 'en_US').format(dateTime); // 5 Feb
  }

  static String currency(double number) {
    return NumberFormat.currency(
      decimalDigits: 0,
      locale: 'en_ID',
      // ignore: unnecessary_string_escapes
      symbol: '\Rp. ',
    ).format(number);
  }

  static String dateOnly(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('yyyy-MM-dd').format(dateTime); // 2024-10-24
  }
}
