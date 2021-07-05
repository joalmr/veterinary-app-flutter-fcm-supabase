import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/dont_exit.dart';
import 'package:vet_app/src/establishments/domain/establishments_controller.dart';

import 'app/establishments_app.dart';
import 'web/establishments_page.dart';

class EstablishmentsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstablishmentsController>(
      init: EstablishmentsController(),
      builder: (_) {
        return DontExit(
          child: context.width < 900
              ? EstablishmentsPageApp()
              : StablishmentsPage(),
        );
      },
    );
  }
}
