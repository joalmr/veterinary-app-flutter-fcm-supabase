import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/domain/establishments_controller.dart';

import 'vet_card.dart';

class VetList extends StatelessWidget {
  const VetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<EstablishmentsController>(
      builder: (_) {
        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.only(left: 30.0, top: 25.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Establecimientos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: btnSecondary(
                        text: 'Nuevo establecimiento',
                        onPressed: () => Get.toNamed('/establishments/create'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 10),
                child: Wrap(children: [
                  for (var establecimiento in _.establecimientos)
                    VetCard(
                      id: establecimiento.id!,
                      image: establecimiento.logo!,
                      name: establecimiento.name!,
                      ruc: establecimiento.ruc!,
                      aprobado: establecimiento.status!,
                      tipo: establecimiento.type!,
                    ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
