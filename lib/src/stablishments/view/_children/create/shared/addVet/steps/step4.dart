import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/stablishments/domain/createVetController.dart';

class Step4 extends StatelessWidget {
  const Step4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVetController>(
      builder: (_) {
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              Text('Descripción'),
              TextFormField(
                onChanged: (val) => _.v.description = val,
                maxLines: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
