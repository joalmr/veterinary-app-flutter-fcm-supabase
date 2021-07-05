import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/create/create_vet_controller.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/data_tipo.dart';

class Step1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return SizedBox(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                controller: _.v.nameVet,
                onChanged: (val) => _.entity.name = val,
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Teléfono'),
                controller: _.v.phoneVet,
                onChanged: (val) => _.entity.phone = val,
                keyboardType: TextInputType.number,
                inputFormatters: [TextInputMask(mask: '999-999-999')],
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(labelText: 'RUC'),
                controller: _.v.rucVet,
                onChanged: (val) => _.entity.ruc = val,
                keyboardType: TextInputType.number,
                inputFormatters: [TextInputMask(mask: '99999999999')],
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Web o red social'),
                controller: _.v.webVet,
                onChanged: (val) => _.entity.website = val,
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
                      value: _.vetType,
                      items: itemTipo.map((ItemService value) {
                        return DropdownMenuItem<String>(
                          value: value.id,
                          child: Text(value.name!),
                        );
                      }).toList(),
                      onChanged: (String? val) {
                        _.vetType = val!;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text('Servicios'),
              Wrap(
                children: _.servicesVet
                    .map(
                      (item) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        child: TextButton(
                          onPressed: () => _.add2List(item.id!),
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.5, horizontal: 5.0),
                            alignment: Alignment.center,
                            backgroundColor: _.servicesVetSet.contains(item.id)
                                ? colorGreen
                                : Colors.transparent,
                            primary: _.servicesVetSet.contains(item.id)
                                ? Colors.white
                                : colorGreen,
                            side: const BorderSide(color: colorGreen),
                          ),
                          child: Text(item.name!),
                        ),
                      ),
                    )
                    .toList()
                    .cast<Widget>(),
              ),
              const SizedBox(height: 5),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
