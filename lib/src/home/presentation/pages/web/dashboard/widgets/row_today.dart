import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';

import 'row_booking.dart';

class RowToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Expanded(
          child: _.today.isEmpty
              ? const Center(
                  child: Text('No tiene atenciones el día de hoy'),
                )
              : ListView.builder(
                  itemCount: _.today.length,
                  itemBuilder: (BuildContext context, int index) {
                    final today = _.today[index];
                    return RowBooking(
                      bookingId: today.id!,
                      petImg: today.petPicture!,
                      petName: today.petName!,
                      petBreed: today.petBreed!,
                      color: colorGreen,
                      status: today.bookingStatus!,
                      date: formatDate(today.bookingDate!),
                      time: today.bookingTime!.substring(0, 5),
                      userName: today.user!,
                      userPhone: 'Ej -> 993926739',
                      bookingServices: today.bookingServices!,
                      observation: today.observation!,
                      address: today.options!.address!,
                      delivery: today.options!.delivery!,
                    );
                  },
                ),
        );
      },
    );
  }
}
