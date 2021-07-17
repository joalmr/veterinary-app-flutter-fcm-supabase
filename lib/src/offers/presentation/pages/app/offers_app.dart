import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/offers/domain/offers_controller.dart';
import 'show/promociones_view.dart';

class OffersPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OffersController>(
      builder: (_) {
        return PromocionesView();
      },
    );
  }
}
