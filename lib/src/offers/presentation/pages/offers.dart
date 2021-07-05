import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/dont_exit.dart';
import '../../domain/offers_controller.dart';

import 'app/offers_app.dart';
import 'web/offers_web.dart';

class OffersMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OffersController>(
      init: OffersController(),
      builder: (_) {
        return DontExit(
          child: context.width < 900 ? OffersPageApp() : OffersPageWeb(),
        );
      },
    );
  }
}
