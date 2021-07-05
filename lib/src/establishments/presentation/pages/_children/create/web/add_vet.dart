import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/body_step.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/header_step.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/row_footer.dart';

class AddVet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return _.checked
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        HeaderStep(selected: _.selected),
                        const SizedBox(width: 60),
                      ],
                    ),
                  ),
                  Expanded(
                    child: BodyStep(selected: _.selected),
                  ),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const FooterCreateVet(),
                  ),
                ],
              );
      },
    );
  }
}
