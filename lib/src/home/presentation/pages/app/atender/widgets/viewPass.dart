import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/home/presentation/pages/app/widgets/cardAttention.dart';

class ViewPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (BuildContext context, int index) {
          return CardAttention(
            petName: 'Elmer',
            petBreed: 'Cocker',
            color: colorBlue,
            status: 'Atendiendo',
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
