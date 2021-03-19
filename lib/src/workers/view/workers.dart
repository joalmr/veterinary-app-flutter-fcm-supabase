import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../domain/workersController.dart';

import 'app/workersApp.dart';
import 'web/workersWeb.dart';

class WorkersMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkersController>(
      init: WorkersController(),
      builder: (_) {
        return context.width < 900 ? WorkersPageApp() : WorkersPageWeb();
      },
    );
  }
}
