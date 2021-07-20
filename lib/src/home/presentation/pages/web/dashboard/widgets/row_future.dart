import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';
import 'row_booking_future.dart';

class RowFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Expanded(
          child: _.incoming.isEmpty
              ? const Center(
                  child: Text('No tiene próximas atenciones'),
                )
              : ListView.builder(
                  itemCount: _.incoming.length,
                  itemBuilder: (BuildContext context, int index) {
                    final incoming = _.incoming[index];
                    return RowBookingFuture(
                      bookingId: incoming.id!,
                      petId: incoming.petId!,
                      petImg: incoming.petPicture!,
                      petName: incoming.petName!,
                      petBreed: incoming.petBreed!,
                      color: colorGreen,
                      status: incoming.bookingStatus!,
                      date: formatDate(incoming.bookingDate!),
                      time: incoming.bookingTime!.substring(0, 5),
                      userName: incoming.user!,
                      userPhone: incoming.userPhone.toString(),
                      bookingServices: incoming.bookingServices!,
                      observation: incoming.observation!,
                      address: incoming.options!.address!,
                      delivery: incoming.options!.delivery!,
                    );
                  },
                ),
        );
      },
    );
  }
}
