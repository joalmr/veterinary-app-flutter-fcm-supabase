import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/stablishments/domain/createVetController.dart';

class Step1 extends StatelessWidget {
  const Step1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVetController>(
      builder: (_) {
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              Text('Nombre'),
              TextFormField(
                onChanged: (val) => _.entity.name = val,
              ),
              SizedBox(height: 5),
              Text('Teléfono'),
              TextFormField(
                onChanged: (val) => _.entity.phone = val,
              ),
              SizedBox(height: 5),
              Text('RUC'),
              TextFormField(
                onChanged: (val) => _.entity.ruc = val,
              ),
              SizedBox(height: 5),
              Text('Web o red social'),
              TextFormField(
                onChanged: (val) => _.entity.website = val,
              ),
              SizedBox(height: 5),
              Text('Tipo'),
              TextFormField(),
              SizedBox(height: 5),
              Text('Servicios'),
              Container(
                height: 40,
                color: Colors.pink,
              ),
              SizedBox(height: 5),
            ],
          ),
        );
      },
    );
  }
}
