import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/offers/domain/offersController.dart';

import 'create/createPromocionView.dart';
import 'show/promocionesView.dart';

class OffersPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OffersController>(
      builder: (_) {
        return Scaffold(
          drawer: MenuDrawer(),
          appBar: AppBar(
            title: Text('Promociones'),
            centerTitle: false,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add_rounded),
            onPressed: () {
              print(_.promociones.length);
              if (_.promociones.length >= 5) {
                Get.snackbar(
                  'Advertencia',
                  'Alcanzaste el límite de promociones, hasta 5 promociones',
                  backgroundColor: colorYellow,
                );
              } else {
                Get.to(CreaPromocionView());
              }
            },
          ),
          body: PromocionesView(),
        );
      },
    );
  }
}
