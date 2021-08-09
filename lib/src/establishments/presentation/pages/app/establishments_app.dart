import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/establishments_controller.dart';
import 'establecimientos/vets_view.dart';

class EstablishmentsPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstablishmentsController>(
      builder: (_) {
        return VetsView();
      },
    );
  }
}
