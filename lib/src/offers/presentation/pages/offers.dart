import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import '../../domain/offers_controller.dart';
import 'app/create/create_promocion_view.dart';
import 'app/offers_app.dart';
import 'web/offers_web.dart';

class OffersMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OffersController>(
      init: OffersController(),
      builder: (_) {
        return MainLayout(
          drawerActive: true,
          title: 'Promociones',
          floatingABOnlyApp: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (_.promociones.length >= 5) {
                Get.snackbar(
                  'Advertencia',
                  'Alcanzaste el límite de promociones, hasta 5 promociones',
                  backgroundColor: colorYellow,
                  colorText: colorBrown1,
                );
              } else {
                Get.to(CreaPromocionView());
              }
            },
            child: const Icon(Icons.add_rounded),
          ),
          body: context.width < 900 ? OffersPageApp() : OffersPageWeb(),
        );
      },
    );
  }
}
