import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/create/create_vet_controller.dart';
import 'app/crea_vet_view.dart';

class CreateVetMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVetController>(
      init: CreateVetController(),
      builder: (_) {
        return context.width < 900 ? CreaVetView() : Container(color: colorRed);
      },
    );
  }
}
