import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/establishmentsController.dart';

import 'app/establishmentsApp.dart';
import 'web/establishmentsPage.dart';

class EstablishmentsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstablishmentsController>(
      builder: (_) {
        return context.width < 900
            ? EstablishmentsPageApp()
            : StablishmentsPage();
      },
    );
  }
}
