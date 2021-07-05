import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';

import 'create/create_worker_view.dart';
import 'show/show_worker_view.dart';

class WorkersPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Administradores'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(const CreaWorkerView()),
        child: const Icon(Icons.add_rounded),
      ),
      body: const ShowWorkerView(),
    );
  }
}
