import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

import 'rowBooking.dart';

class RowToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return RowBooking(
            petName: 'Elmer',
            petBreed: 'Cocker',
            color: colorGreen,
            status: 'Confirmado',
            date: '20-02-2021',
            time: '14:00',
            userName: 'Alonso',
            userPhone: '993926739',
            types: 'Consulta, antipulgas, baño',
            observation: '-',
          );
        },
      ),
    );
  }
}
