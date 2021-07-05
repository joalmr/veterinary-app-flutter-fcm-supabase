import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';
import 'acttionBooking/por_confirmar.dart';
import 'atender/atender.dart';

class HomePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Scaffold(
          drawer: const MenuDrawer(),
          appBar: AppBar(
            title: FadeIn(child: Text(_.nameVet.value!)),
            actions: [
              IconButton(
                onPressed: () {
                  Get.offNamed(NameRoutes.establishments);
                },
                icon: const Icon(Icons.star_rounded),
              ),
            ],
          ),
          body: _.carga
              ? const Center(
                  child: const CircularProgressIndicator(),
                )
              : DefaultTabController(
                  length: 2,
                  initialIndex: _.unconfirmed.isNotEmpty ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const TabBar(
                        indicatorColor: colorMain,
                        labelColor: colorMain,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelColor: Colors.black54,
                        unselectedLabelStyle:
                            TextStyle(fontWeight: FontWeight.normal),
                        tabs: [
                          Tab(text: 'Atender'),
                          Tab(text: 'Confirmar'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            const AtenderView(),
                            ConfirmarView(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
