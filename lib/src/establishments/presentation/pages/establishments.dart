import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/src/establishments/domain/establishments_controller.dart';
import 'package:vet_app/src/workers/presentation/pages/workers.dart';
import 'app/establishments_app.dart';
import 'web/establishments_page.dart';

class EstablishmentsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstablishmentsController>(
      builder: (_) {
        return MainLayout(
          drawerActive: true,
          title: 'Establecimientos',
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
          floatingActionButton: GetPlatform.isWeb? SizedBox(height: 0) : FloatingActionButton(
            onPressed: () => Get.toNamed('/establishments/create'),
            child: const Icon(Icons.add_rounded),
          ),
          floatingABOnlyApp: true,
          body: context.width < 900
              ? EstablishmentsPageApp()
              : StablishmentsPage(),
        );
      },
    );
  }
}
