import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';
import 'package:vet_app/src/home/presentation/pages/app/widgets/card_booking.dart';

class ConfirmarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return _.carga
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _.unconfirmed.isEmpty
                ? const Center(
                    child: Text('No tiene reservas por confirmar'),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 15),
                    itemCount: _.unconfirmed.length,
                    itemBuilder: (BuildContext context, int i) {
                      final unconfirmed = _.unconfirmed[i];
                      return CardBooking(
                        bookingId: unconfirmed.id!,
                        petImg: unconfirmed.petPicture!,
                        petName: unconfirmed.petName!,
                        petBreed: unconfirmed.petBreed!,
                        color: Colors.deepPurple[200]!,
                        status: unconfirmed.bookingStatus!,
                        date: formatDate(unconfirmed.bookingDate!),
                        time: unconfirmed.bookingTime!.substring(0, 5),
                        userName: unconfirmed.user!,
                        userPhone: unconfirmed.userPhone!,
                        bookingServices: unconfirmed.bookingServices!,
                        observation: unconfirmed.observation!,
                        address: unconfirmed.options!.address!,
                        delivery: unconfirmed.options!.delivery!,
                      );
                    },
                  );
      },
    );
  }
}
