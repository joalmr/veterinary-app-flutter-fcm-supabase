import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/bookings/domain/bookingController.dart';

import 'app/atenderView.dart';
import 'web/atenderWeb.dart';

class AtenderMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      init: BookingController(),
      builder: (_) {
        return context.width < 900 ? AtenderView() : AtenderWeb();
      },
    );
  }
}
