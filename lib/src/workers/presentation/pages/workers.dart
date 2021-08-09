import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import '../../domain/workers_controller.dart';

import 'app/create/create_worker_view.dart';
import 'app/workers_app.dart';
import 'web/workers_web.dart';

class WorkersMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkersController>(
      init: WorkersController(),
      builder: (_) {
        return MainLayout(
          title: 'Administradores',
          floatingABOnlyApp: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.to(CreaWorkerView()),
            child: Icon(Icons.add_rounded),
          ),
          body: context.width < 900 ? WorkersPageApp() : WorkersPageWeb(),
        );
        // return ;
      },
    );
  }
}
