import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/src/establishments/domain/establishmentsController.dart';
import 'establecimientos/vetsView.dart';

class EstablishmentsPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstablishmentsController>(
      builder: (_) {
        return Scaffold(
          drawer: MenuDrawer(),
          appBar: AppBar(
            title: Text('Establecimientos'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add_rounded),
            onPressed: () => Get.toNamed('/establishments/create'),
          ),
          body: VetsView(),
          // _.carga 
          // ? Center(child: CircularProgressIndicator())
          // : VetsView(),
        );
      },
    );
  }
}
