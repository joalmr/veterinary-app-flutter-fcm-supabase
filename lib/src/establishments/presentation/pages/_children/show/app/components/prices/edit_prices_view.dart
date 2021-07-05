import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/domain/edit/edit_prices_controller.dart';

class EditPricesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPricesController>(
      init: EditPricesController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Editar precios'),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Consulta'),
                    controller: _.consultaControl,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Desparasitación'),
                    controller: _.desparasitaControl,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Vacuna'),
                    controller: _.vacunaControl,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Grooming'),
                    controller: _.groomingControl,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: btnSecondary(
                      text: 'Guardar',
                      onPressed: _.editPrecios,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
