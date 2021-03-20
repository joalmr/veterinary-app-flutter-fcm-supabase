import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/stablishments/domain/createVetController.dart';

class Step2 extends StatelessWidget {
  const Step2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVetController>(
      builder: (_) {
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              Text('Dirección'),
              TextFormField(),
              SizedBox(height: 5),
              Container(
                height: 250,
                color: Colors.pink,
              ),
              SizedBox(height: 5),
              Text('Referencia'),
              TextFormField(),
              SizedBox(height: 25),
              Center(
                child: btnSecondary(
                  text: 'Crear y continuar',
                  onPressed: () => _.newEstablishment(),
                ), //newEstablishment
              ),
            ],
          ),
        );
      },
    );
  }
}
