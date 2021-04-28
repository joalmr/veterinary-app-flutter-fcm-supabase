import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/domain/edit/editBaseController.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/dataTipo.dart';

import 'dirBase.dart';

class EditBaseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<EditBaseController>(
      init: EditBaseController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Editar datos base'),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 40,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _.nameControl,
                    decoration: InputDecoration(labelText: 'Nombre'),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _.phoneControl,
                    decoration: InputDecoration(labelText: 'Teléfono'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [TextInputMask(mask: '999-999-999')],
                  ),
                  SizedBox(height: 15),
                  Text('Tipo'),
                  Material(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: _.vetTypeId,
                          items: itemTipo.map((ItemService value) {
                            return new DropdownMenuItem<String>(
                              value: value.id,
                              child: new Text(value.name),
                            );
                          }).toList(),
                          onChanged: (val) {
                            _.vetTypeId = val;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  DirBase(
                    direccion: 'Direccion',
                    controller: _.addressControl,
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: btnSecondary(
                      text: 'Guardar',
                      onPressed: _.updateBase,
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
