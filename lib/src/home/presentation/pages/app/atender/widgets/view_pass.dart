import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';
import 'package:vet_app/src/home/presentation/pages/app/widgets/card_attention.dart';

class ViewPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Expanded(
          child: _.overdue.isEmpty
              ? const Center(
                  child: Text('No tiene atenciones pasadas'),
                )
              : ListView.builder(
                  itemCount: _.overdue.length,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  itemBuilder: (BuildContext context, int index) {
                    final overdue = _.overdue[index];
                    return CardAttention(
                      attentionType: 1,
                      bookingId: overdue.id!,
                      petImg: overdue.petPicture!,
                      petName: overdue.petName!,
                      petBreed: overdue.petBreed!,
                      color: colorGreen,
                      status: overdue.bookingStatus!,
                      date: formatDate(overdue.bookingDate!),
                      time: overdue.bookingTime!.substring(0, 5),
                      userName: overdue.user!,
                      userPhone: overdue.userPhone!,
                      bookingServices: overdue.bookingServices!,
                      observation: overdue.observation!,
                      address: overdue.options!.address!,
                      delivery: overdue.options!.delivery!,
                    );
                  },
                ),
        );
      },
    );
  }
}
