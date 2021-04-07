import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';

import 'create/createWorkerView.dart';
import 'show/showWorkerView.dart';

class WorkersPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text('Administradores'),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_rounded),
        onPressed: () => Get.to(CreaWorkerView()),
      ),
      body: ShowWorkerView(),
    );
  }
}
