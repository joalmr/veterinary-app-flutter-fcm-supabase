import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

Widget horario({required String day,required  bool daySwitch,required  String timeStart,required  String timeEnd}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5, left: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          day,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Icon(
              daySwitch
                  ? Icons.check_circle_outline_rounded
                  : Icons.remove_circle_outline_rounded,
              size: 14,
              color: daySwitch ? colorMain : colorRed,
            ),
            Text(
              daySwitch ? 'Abierto' : 'Cerrado',
            ),
          ],
        ),
        Text('$timeStart - $timeEnd'),
      ],
    ),
  );
}
