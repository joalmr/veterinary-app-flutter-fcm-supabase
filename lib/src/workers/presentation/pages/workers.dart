import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/dontExit.dart';
import '../../domain/workersController.dart';

import 'app/workersApp.dart';
import 'web/workersWeb.dart';

class WorkersMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkersController>(
      init: WorkersController(),
      builder: (_) {
        return DontExit(
          child: context.width < 900 ? WorkersPageApp() : WorkersPageWeb(),
        );
      },
    );
  }
}
