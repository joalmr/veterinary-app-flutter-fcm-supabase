import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/utils/days/dia_semana.dart';
import 'package:vet_app/src/establishments/domain/create/create_vet_controller.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/check_horario.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/data_tipo.dart';

class Step3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return SizedBox(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              const SizedBox(height: 15),
              const Text(
                'Personal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const Text('Tipo'),
              Material(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: _.personalType,
                      items: personalTipo.map((ItemService value) {
                        return DropdownMenuItem<String>(
                          value: value.id,
                          child: Text(value.name!),
                        );
                      }).toList(),
                      onChanged: (String? val) {
                        _.personalType = val!;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Nombre y apellido'),
                controller: _.v.personalNameVet,
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 15),
              _.personalType == '2'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Código CMV'),
                          controller: _.v.personalCodeVet,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    )
                  : const SizedBox(height: 0),
              const SizedBox(height: 15),
              const Text(
                'Horario',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Divider(),
              for (var i = 0; i < 7; i++)
                CheckHorario(
                  iniController: _.v.iniController[i],
                  endController: _.v.endController[i],
                  day: diaSemana[i],
                  index: i,
                ),
              const SizedBox(height: 15),
              const Text(
                'Precios',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Divider(),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Consulta'),
                controller: _.v.moneyConsulta,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Desparasitación'),
                controller: _.v.moneyDesparasita,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Vacuna'),
                controller: _.v.moneyVacuna,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Grooming'),
                controller: _.v.moneyGrooming,
                keyboardType: TextInputType.number,
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
