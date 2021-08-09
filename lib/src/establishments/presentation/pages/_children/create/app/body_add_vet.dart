import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/create/create_vet_controller.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/body_step.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/header_step.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/row_footer.dart';

class BodyAddVet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20),
                  HeaderStep(selected: _.selected),
                ],
              ),
            ),
            Expanded(
              child: BodyStep(selected: _.selected),
            ),
            GetPlatform.isIOS
                ? Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: FooterCreateVet(),
                  )
                : FooterCreateVet(),
          ],
        );
      },
    );
  }
}
