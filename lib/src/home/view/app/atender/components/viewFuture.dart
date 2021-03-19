import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/home/view/app/components/cardAttention.dart';

class ViewFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (BuildContext context, int index) {
          return CardAttention(
            petName: 'Elmer',
            petBreed: 'Cocker',
            color: colorYellow,
            status: 'Reprogramado',
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
