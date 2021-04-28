import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/bodyStep.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/headerStep.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/rowFooter.dart';

class BodyAddVet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 20),
                  HeaderStep(selected: _.selected),
                ],
              ),
            ),
            Expanded(
              child: BodyStep(selected: _.selected),
            ),
            FooterCreateVet(),
          ],
        );
      },
    );
  }
}
