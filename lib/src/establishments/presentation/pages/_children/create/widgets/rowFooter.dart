import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';

class FooterCreateVet extends StatelessWidget {
  const FooterCreateVet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return ConditionalSwitch.single<int>(
          context: context,
          valueBuilder: (BuildContext context) => _.selected,
          caseBuilders: {
            1: (BuildContext context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 0),
                    btnAltern(
                      bold: true,
                      text: 'Continuar',
                      onPressed: _.validaStep1,
                    ),
                  ],
                ),
            2: (BuildContext context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    btnAltern(
                      bold: true,
                      text: 'Volver',
                      onPressed: () {
                        if (_.selected > 1) _.selected--;
                      },
                    ),
                    btnAltern(
                      bold: true,
                      text: 'Continuar',
                      onPressed: _.validaStep2,
                    ),
                  ],
                ),
            3: (BuildContext context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    btnAltern(
                      bold: true,
                      text: 'Volver',
                      onPressed: () {
                        if (_.selected > 1) _.selected--;
                      },
                    ),
                    btnAltern(
                      bold: true,
                      text: 'Continuar',
                      onPressed: _.validaStep3,
                    ),
                  ],
                ),
            4: (BuildContext context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    btnAltern(
                      bold: true,
                      text: 'Volver',
                      onPressed: () {
                        if (_.selected > 1) _.selected--;
                      },
                    ),
                    btnAltern(
                      bold: true,
                      text: 'Finalizar',
                      color: colorMain,
                      onPressed: _.validaStep4,
                    ),
                  ],
                ),
          },
          fallbackBuilder: (BuildContext context) => const SizedBox(height: 0),
        );
      },
    );
  }
}
