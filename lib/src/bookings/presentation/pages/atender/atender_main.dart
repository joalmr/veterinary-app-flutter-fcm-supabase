import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';

import 'app/atender_view.dart';
import 'web/atender_web.dart';

class AtenderMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      init: BookingController(),
      builder: (_) {
        return MainLayout(
          title: 'Atención',
          body: _.loadingPage.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GetPlatform.isWeb
                  ? AtenderWeb()
                  : AtenderView(),
        );
        // return;
      },
    );
  }
}
