import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

formatDateTime(DateTime dateTime) {
  String formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
  return formattedDate;
}

formatDate(DateTime dateTime) {
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
  return formattedDate;
}

formatTime(DateTime dateTime) {
  String formattedDate = DateFormat('HH:mm').format(dateTime);
  return formattedDate;
}

formatDateOut({
  @required String valor,
  @required String formatIn,
  @required String formatOut,
}) {
  DateTime tempDate = DateFormat(formatIn).parse(valor);
  String tempDateString = DateFormat(formatOut).format(tempDate);

  return tempDateString;
}

toDate(String valor) {
  DateTime tempDate = new DateFormat("dd-MM-yyyy").parse(valor);
  return tempDate;
}
