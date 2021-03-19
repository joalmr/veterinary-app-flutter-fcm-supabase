import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/utils/datetimeFormat.dart';
import 'package:vet_app/src/home/data/model/bookingModel.dart';
import 'package:vet_app/src/home/domain/controller/homeController.dart';
import 'package:vet_app/src/home/view/app/components/cardBooking.dart';

class ConfirmarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return _.v.carga
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _.v.reservas.length == 0
                ? Center(
                    child: Text('No tiene reservas por confirmar'),
                  )
                : ListView.builder(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                    itemCount: _.v.reservas.length,
                    itemBuilder: (BuildContext context, int i) {
                      ReservaModel booking = _.v.reservas[i];
                      return CardBooking(
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
                  );
      },
    );
  }
}
