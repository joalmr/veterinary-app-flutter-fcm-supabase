import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';
import 'package:vet_app/src/bookings/domain/json/json_proxima_cita.dart';

Widget itemCitas({String? text, String? slug}) {
  final _book = Get.find<BookingController>();
  return GestureDetector(
    onTap: () {
      Get.dialog(
        AlertDialog(
          scrollable: true,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var item in jsonProximaCita[slug]!)
                ListTile(
                  title: Text(item),
                  onTap: () {
                    _book.add2List(
                      {
                        'type': slug,
                        'name': item,
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.only(top: 2.5, bottom: 2.5, left: 5, right: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(1.1, 1.1),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Text(
        text!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
