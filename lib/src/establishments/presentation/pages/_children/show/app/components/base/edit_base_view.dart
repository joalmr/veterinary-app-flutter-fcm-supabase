import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/domain/edit/edit_base_controller.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/data_tipo.dart';

import 'dir_base.dart';

class EditBaseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<EditBaseController>(
      init: EditBaseController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Editar datos base'),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
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
                    decoration: const InputDecoration(labelText: 'Nombre'),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _.phoneControl,
                    decoration: const InputDecoration(labelText: 'Teléfono'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [TextInputMask(mask: '999-999-999')],
                  ),
                  const SizedBox(height: 15),
                  const Text('Tipo'),
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
                            return DropdownMenuItem<String>(
                              value: value.id,
                              child: Text(value.name!),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            _.vetTypeId = val!;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  DirBase(
                    direccion: 'Direccion',
                    controller: _.addressControl,
                  ),
                  const SizedBox(height: 20),
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
