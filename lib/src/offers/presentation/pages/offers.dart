import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/dont_exit.dart';
import '../../domain/offersController.dart';

import 'app/offersApp.dart';
import 'web/offersWeb.dart';

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
