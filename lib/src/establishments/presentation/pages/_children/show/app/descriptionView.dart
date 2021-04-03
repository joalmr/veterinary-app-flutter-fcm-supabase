import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/domain/edit/editVetController.dart';

class DescriptionView extends StatelessWidget {
  final String description;
  const DescriptionView({Key key, @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditVetController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 0.0,
                  bottom: 5.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Descripción",
                      style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                    ),
                    IconButton(
                      splashRadius: 20,
                      iconSize: 18,
                      icon: Icon(
                        Icons.edit,
                      ),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 40,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Editar descripción',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text('Descripción'),
                                  TextFormField(
                                    controller: _.descripcionControl,
                                    textCapitalization:
                                        TextCapitalization.sentences,
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
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
