import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';
import 'app/home_app.dart';
import 'web/home_web.dart';

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return MainLayout(
          drawerActive: true,
          title: _.nameVet.value ?? '',
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(NameRoutes.chats);
              },
              icon: const Icon(Icons.chat_bubble),
            ),
            IconButton(
              onPressed: () {
                Get.offNamed(NameRoutes.establishments);
              },
              icon: const Icon(Icons.star_rounded),
            ),
          ],
          body: context.width < 900 ? HomePageApp() : HomePageWeb(),
        );
      },
    );
  }
}
