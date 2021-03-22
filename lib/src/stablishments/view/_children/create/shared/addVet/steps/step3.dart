import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/utils/diaSemana.dart';
import 'package:vet_app/src/stablishments/domain/createVetController.dart';
import 'package:vet_app/src/stablishments/view/_children/create/shared/addVet/components/checkHorario.dart';

class Step3 extends StatelessWidget {
  const Step3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVetController>(
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
              TextFormField(),
              SizedBox(height: 5),
              Text('Nombre y apellido'),
              TextFormField(),
              SizedBox(height: 15),
              Text(
                'Horario',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              for (var i = 0; i < 7; i++)
                CheckHorario(
                  dia: diaSemana[i],
                ),
              SizedBox(height: 15),
              Text(
                'Precios',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Text('Consulta'),
              TextFormField(
                onChanged: (val) {
                  print(val);
                  print(_.v.moneyConsulta.numberValue);
                },
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
