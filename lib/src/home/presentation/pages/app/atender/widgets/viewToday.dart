import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/home/domain/homeController.dart';
import 'package:vet_app/src/home/presentation/pages/app/widgets/cardAttention.dart';

class ViewToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return _.today.length == 0
            ? Center(
                child: Text('No tiene atenciones el día de hoy'),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: _.today.length,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  itemBuilder: (BuildContext context, int index) {
                    final today = _.today[index];
                    return CardAttention(
                      petName: today.petName,
                      petBreed: today.petBreed,
                      color: colorGreen,
                      status: today.bookingStatus,
                      date: formatDate(today.bookingDate),
                      time: today.bookingTime.substring(0, 5),
                      userName: today.user,
                      userPhone: 'Ej -> 993926739',
                      types: 'xc -> Consulta, antipulgas, baño',
                      observation: today.observation,
                    );
                  },
                ),
              );
      },
    );
  }
}
