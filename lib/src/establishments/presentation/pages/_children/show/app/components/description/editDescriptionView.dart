import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/domain/edit/editDescriptionController.dart';

class EditDescriptionView extends StatelessWidget {
  const EditDescriptionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditDescriptionController>(
      init: EditDescriptionController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Editar descripción'),
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
                    decoration: InputDecoration(labelText: 'Descripción'),
                    controller: _.descripcionControl,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 10,
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: btnSecondary(
                      text: 'Guardar',
                      onPressed: _.editDescripcion,
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: btnAltern(
                      text: 'Volver',
                      onPressed: () => Get.back(),
                      bold: true,
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
