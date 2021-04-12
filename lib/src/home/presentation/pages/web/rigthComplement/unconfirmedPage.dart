import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/components/subheader.dart';
import 'package:vet_app/src/home/data/model/bookingModel.dart';
import 'package:vet_app/src/home/domain/homeController.dart';

import 'widgets/rowUnconfirmed.dart';

class Unconfirmed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Container(
          color: Color(0xffF7F7FF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.0),
              subHeader(title: 'Reservas por confirmar'),
              SizedBox(height: 10.0),
              Expanded(
                child: _.carga
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : _.reservas.length == 0
                        ? Center(
                            child: Text('No tiene reservas por confirmar'),
                          )
                        : ListView.builder(
                            itemCount: _.reservas.length,
                            itemBuilder: (BuildContext context, int index) {
                              ReservaModel booking = _.reservas[index];
                              return RowUnconfirmed(
                                bookingId: booking.id,
                                petImg: booking.petPicture,
                                petName: booking.petName,
                                petBreed: booking.petBreed,
                                color: Colors.deepPurple[200],
                                status: booking.bookingStatus,
                                date: formatDate(booking.bookingDate),
                                time: booking.bookingTime.substring(0, 5),
                                userName: booking.user,
                                userPhone: 'Ejm -> 993926739',
                                types: 'Ejm -> Consulta, antipulgas, baño',
                                observation: 'Ejm -> cojo',
                              );
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }
}
