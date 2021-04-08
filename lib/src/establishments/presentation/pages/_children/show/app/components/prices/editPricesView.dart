import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/domain/edit/editPricesController.dart';

class EditPricesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPricesController>(
      init: EditPricesController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Editar precios'),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Consulta'),
                    controller: _.consultaControl,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Desparasitación'),
                    controller: _.desparasitaControl,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Vacuna'),
                    controller: _.vacunaControl,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Grooming'),
                    controller: _.groomingControl,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
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
