import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';
import 'package:vet_app/design/styles/styles.dart';

Widget dateForm({Function(String) onChanged}) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      hintText: 'dd-mm-yyyy',
      prefixIcon: Icon(
        Icons.calendar_today,
        color: colorMain,
      ),
    ),
    inputFormatters: [
      TextInputMask(
        mask: '99-99-9999',
      )
    ],
    onChanged: onChanged,
  );
}

String validaDate(String texto) {
  if (texto.isEmpty) return 'Ingrese fecha';
  if (texto.length < 10) return 'Complete fecha';

  final dateWrite = texto.split('-');
  final int year = int.parse(dateWrite[2]);
  final int month = int.parse(dateWrite[1]);
  final int day = int.parse(dateWrite[0]);
  final int lastday = DateTime(year, month + 1, 0).day;

  if (day < 1 || day > 31 || month < 1 || month > 12)
    return 'Formato de fecha invalido';
  else {
    if (lastday < day) {
      return 'El día seleccionado no es correcto';
    } else {
      DateTime dateNow = DateTime.now();
      DateTime tempDate = new DateFormat("dd-MM-yyyy").parse(texto);
      // print(tempDate);
      int diff = tempDate.difference(dateNow).inDays;
      if (diff < 0) return 'Debe escribir una fecha mayor';
    }
  }
  return null;
}
