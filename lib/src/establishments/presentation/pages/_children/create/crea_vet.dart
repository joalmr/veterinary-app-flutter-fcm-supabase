import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';
import 'app/crea_vet_view.dart';
import 'web/crea_vet_page.dart';

class CreateVetMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVetController>(
      init: CreateVetController(),
      builder: (_) {
        return context.width < 900 ? CreaVetView() : CreaVetPage();
      },
    );
  }
}
