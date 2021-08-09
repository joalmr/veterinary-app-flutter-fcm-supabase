import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/create/create_vet_controller.dart';

class Step4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVetController>(
      builder: (_) {
        return SizedBox(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descripción'),
                controller: _.v.descriptionVet,
                onChanged: (val) => _.description = val,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
