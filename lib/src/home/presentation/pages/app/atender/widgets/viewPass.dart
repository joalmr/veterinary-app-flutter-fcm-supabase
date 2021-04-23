import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/home/domain/homeController.dart';
import 'package:vet_app/src/home/presentation/pages/app/widgets/cardAttention.dart';

class ViewPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return _.overdue.length == 0
            ? Center(
                child: Text('No tiene atenciones vencidas'),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: _.overdue.length,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  itemBuilder: (BuildContext context, int index) {
                    final overdue = _.overdue[index];
                    return CardAttention(
                      petName: overdue.petName,
                      petBreed: overdue.petBreed,
                      color: colorGreen,
                      status: overdue.bookingStatus,
                      date: formatDate(overdue.bookingDate),
                      time: overdue.bookingTime,
                      userName: overdue.user,
                      userPhone: 'Ej -> 993926739',
                      types: 'xc -> Consulta, antipulgas, baño',
                      observation: overdue.observation,
                    );
                  },
                ),
              );
      },
    );
  }
}
