import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/src/establishments/domain/establishments_controller.dart';
import 'package:vet_app/src/workers/presentation/pages/workers.dart';
import 'establecimientos/vets_view.dart';

class EstablishmentsPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstablishmentsController>(
      builder: (_) {
        return Scaffold(
          drawer: const MenuDrawer(),
          appBar: AppBar(
            title: const Text('Establecimientos'),
            actions: [
              prefUser.userRol != 'moderator'
                  ? SizedBox(width: 0)
                  : IconButton(
                      onPressed: () {
                        Get.to(WorkersMain());
                      },
                      icon: Icon(Icons.people_rounded),
                    )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed('/establishments/create'),
            child: const Icon(Icons.add_rounded),
          ),
          body: VetsView(),
        );
      },
    );
  }
}
