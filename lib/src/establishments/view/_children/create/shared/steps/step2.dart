import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/domain/createVetController.dart';

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
              TextFormField(
                controller: _.v.dirVet,
              ),
              SizedBox(height: 5),
              Container(
                height: 250,
                color: Colors.pink,
              ),
              SizedBox(height: 5),
              Text('Referencia'),
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
              ),
              SizedBox(height: 25),
              Center(
                child: btnSecondary(
                  text: 'Crear y continuar',
                  onPressed: () => _.validaStep2(),
                ), //newEstablishment
              ),
            ],
          ),
        );
      },
    );
  }
}
