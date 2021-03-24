import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/utils/diaSemana.dart';
import 'package:vet_app/src/establishments/domain/createVetController.dart';
import 'package:vet_app/src/establishments/view/_children/create/shared/components/checkHorario.dart';

import 'dataTipo.dart';

class Step3 extends StatelessWidget {
  const Step3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              SizedBox(height: 15),
              Text(
                'Personal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Text('Tipo'),
              Material(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: _.v.personalType,
                      items: personalTipo.map((ItemService value) {
                        return new DropdownMenuItem<String>(
                          value: value.id,
                          child: new Text(value.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        print(val);
                        _.v.personalType = val;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text('Nombre y apellido'),
              TextFormField(
                controller: _.v.personalNameVet,
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: 5),
              _.v.personalType == '2'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Código CMV'),
                        TextFormField(
                          controller: _.v.personalCodeVet,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    )
                  : SizedBox(height: 0),
              SizedBox(height: 15),
              Text(
                'Horario',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              for (var i = 0; i < 7; i++)
                CheckHorario(
                  iniController: _.v.iniController[i],
                  endController: _.v.endController[i],
                  day: diaSemana[i],
                  index: i,
                ),
              SizedBox(height: 15),
              Text(
                'Precios',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Text('Consulta'),
              TextFormField(
                controller: _.v.moneyConsulta,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 5),
              Text('Desparasitación'),
              TextFormField(
                controller: _.v.moneyDesparasita,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 5),
              Text('Vacuna'),
              TextFormField(
                controller: _.v.moneyVacuna,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 5),
              Text('Grooming'),
              TextFormField(
                controller: _.v.moneyGrooming,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 5),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
