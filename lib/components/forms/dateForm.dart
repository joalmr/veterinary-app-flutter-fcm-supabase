import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';

Widget dateForm({Function(String) onChanged, TextEditingController controller, String initialValue}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.number,
    initialValue: initialValue,
    decoration: InputDecoration(
      hintText: 'dd-mm-yyyy',
      prefixIcon: Icon(
        Icons.calendar_today,
        color: colorMain,
      ),
      labelText: 'dd-mm-yyyy',
    ),
    inputFormatters: [
      TextInputMask(
        mask: '99-99-9999',
      )
    ],
    onChanged: onChanged,
  );
}

Widget calendarForm({TextEditingController controller, Function(String) onChanged, DateTime initialDate}){
  return TextFormField(
    controller: controller,
    enableInteractiveSelection: false,
    readOnly: true,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.calendar_today,
        color: colorMain,
      ),
    ),
    onTap: () async {
      DateTime picked = await showDatePicker(
        context: Get.context,
        initialDate: initialDate,
        firstDate: new DateTime(2020),
        lastDate: new DateTime.now()
      );
      if(picked != null){
        initialDate = picked;
        controller.text = formatDateBasic(picked);
      }
    },
    onChanged: onChanged,
  );
}

//! para utilizar en los controladores
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

      int diff = tempDate.difference(dateNow).inDays;
      if (diff < 0) return 'Debe escribir una fecha mayor';
    }
  }
  return null;
}
