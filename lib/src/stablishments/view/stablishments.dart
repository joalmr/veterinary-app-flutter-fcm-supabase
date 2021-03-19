import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/stablishments/domain/establishmentsController.dart';

import 'app/stablishmentsApp.dart';
import 'web/stablishmentsPage.dart';

class StablishmentsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstablishmentsController>(
      init: EstablishmentsController(),
      builder: (_) {
        return context.width < 900
            ? StablishmentsPageApp()
            : StablishmentsPage();
      },
    );
  }
}
