import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../domain/offersController.dart';

import 'app/offersApp.dart';
import 'web/offersWeb.dart';

class OffersMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OffersController>(
      init: OffersController(),
      builder: (_) {
        return context.width < 900 ? OffersPageApp() : OffersPageWeb();
      },
    );
  }
}
