import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/components/subheader.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';

import 'widgets/row_unconfirmed.dart';

class Unconfirmed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Container(
          color: const Color(0xffF7F7FF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              subHeader(title: 'Reservas por confirmar'),
              const SizedBox(height: 10.0),
              Expanded(
                child: _.carga
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : _.unconfirmed.isEmpty
                        ? const Center(
                            child: Text('No tiene reservas por confirmar'),
                          )
                        : ListView.builder(
                            itemCount: _.unconfirmed.length,
                            itemBuilder: (BuildContext context, int index) {
                              final unconfirmed = _.unconfirmed[index];
                              return RowUnconfirmed(
                                bookingId: unconfirmed.id!,
                                petImg: unconfirmed.petPicture!,
                                petName: unconfirmed.petName!,
                                petBreed: unconfirmed.petBreed!,
                                color: Colors.deepPurple[200]!,
                                status: unconfirmed.bookingStatus!,
                                date: formatDate(unconfirmed.bookingDate!),
                                time: unconfirmed.bookingTime!.substring(0, 5),
                                userName: unconfirmed.user!,
                                userPhone: 'Ej -> 993926739',
                                bookingServices: unconfirmed.bookingServices!,
                                observation: unconfirmed.observation!,
                                address: unconfirmed.options!.address!,
                                delivery: unconfirmed.options!.delivery!,
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
