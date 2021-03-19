import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/stablishments/domain/establishmentsController.dart';

import 'app/creaVetView.dart';
import 'web/creaVetPage.dart';

class CreateVetMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstablishmentsController>(
      builder: (_) {
        return context.width < 900 ? CreaVetView() : CreaVetPage();
      },
    );
  }
}
