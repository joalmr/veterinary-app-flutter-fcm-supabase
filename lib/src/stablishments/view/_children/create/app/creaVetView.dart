import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/stablishments/domain/createVetController.dart';
import 'package:vet_app/src/stablishments/view/_children/create/shared/addVet.dart';
import 'package:vet_app/src/stablishments/view/_children/create/shared/addVet/components/numStep.dart';

class CreaVetView extends StatelessWidget {
  const CreaVetView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVetController>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: NumStep(),
            title: Text('Crea establecimiento'),
            centerTitle: false,
          ),
          body: AddVet(),
        );
      },
    );
  }
}
