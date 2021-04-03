import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/establishmentsController.dart';
import 'components/CardVet.dart';

class VetsView extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return GetX<EstablishmentsController>(
      builder: (_) {
        return RefreshIndicator(
          key: refreshKey,
          onRefresh: _.refresh,
          child: ListView.builder(
            itemCount: _.establecimientos.length,
            itemBuilder: (BuildContext context, int index) {
              final establecimiento = _.establecimientos[index];
              return CardEstablecimiento(
                id: establecimiento.id,
                image: establecimiento.logo,
                name: establecimiento.name,
                ruc: establecimiento.ruc,
                aprobado: establecimiento.status,
                tipo: establecimiento.type,
              );
            },
          ),
        );
      },
    );
  }
}
