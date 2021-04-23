import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/home/domain/homeController.dart';
import 'package:vet_app/src/home/presentation/pages/app/widgets/cardAttention.dart';

class ViewFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Expanded(
          child: ListView.builder(
            itemCount: _.incoming.length,
            padding: EdgeInsets.only(left: 10, right: 10),
            itemBuilder: (BuildContext context, int index) {
              final incoming = _.incoming[index];
              return CardAttention(
                petName: incoming.petName,
                petBreed: incoming.petBreed,
                color: colorGreen,
                status: incoming.bookingStatus,
                date: formatDate(incoming.bookingDate),
                time: incoming.bookingTime,
                userName: incoming.user,
                userPhone: 'Ej -> 993926739',
                types: 'xc -> Consulta, antipulgas, baño',
                observation: incoming.observation,
              );
            },
          ),
        );
      },
    );
  }
}
