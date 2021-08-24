import 'package:intl/intl.dart';

String formatDateEmail(DateTime dateTime) {
  final String formattedDate = DateFormat('ddMMyyyyHHmmss').format(dateTime);
  return formattedDate;
}

String formatDateTime(DateTime dateTime) {
  final String formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
  return formattedDate;
}

String formatDate(DateTime dateTime) {
  final String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
  return formattedDate;
}

String formatDateBasic(DateTime dateTime) {
  final String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDate;
}

String formatYMDHms(DateTime dateTime) {
  final String formattedDate =
      DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  return formattedDate;
}

String formatDateYM(DateTime dateTime) {
  final String formattedDate = DateFormat('yyyy-MM').format(dateTime);
  return formattedDate;
}

String formatTime(DateTime dateTime) {
  final String formattedDate = DateFormat('HH:mm').format(dateTime);
  return formattedDate;
}

String formatDateOut({
  required String valor,
  required String formatIn,
  required String formatOut,
}) {
  final DateTime tempDate = DateFormat(formatIn).parse(valor);
  final String tempDateString = DateFormat(formatOut).format(tempDate);

  return tempDateString;
}

DateTime toDate(String valor) {
  final DateTime tempDate = DateFormat('dd-MM-yyyy').parse(valor);
  return tempDate;
}

DateTime toDateBasic(String valor) {
  final DateTime tempDate = DateFormat('yyyy-MM-dd').parse(valor);
  return tempDate;
}
