import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/workers_controller.dart';

import 'app/workers_app.dart';
import 'web/workers_web.dart';

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
