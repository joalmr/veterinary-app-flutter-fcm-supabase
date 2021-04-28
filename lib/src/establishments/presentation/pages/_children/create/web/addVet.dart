import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/bodyStep.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/headerStep.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/rowFooter.dart';

class AddVet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return 
        _.checked
        ? Center(
            child: CircularProgressIndicator(),
          )
        :
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  HeaderStep(selected: _.selected),
                  SizedBox(width: 60),
                ],
              ),
            ),
            Expanded(
              child: BodyStep(selected: _.selected),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FooterCreateVet(),
            ),
          ],
        );
      },
    );
  }
}
