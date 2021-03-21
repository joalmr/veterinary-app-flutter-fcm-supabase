import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/stablishments/domain/createVetController.dart';
import 'app/creaVetView.dart';
import 'web/creaVetPage.dart';

class CreateVetMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVetController>(
      init: CreateVetController(),
      builder: (_) {
        return context.width > 900 ? CreaVetPage() : CreaVetView();
      },
    );
  }
}
