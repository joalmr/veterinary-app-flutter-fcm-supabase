import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/stablishments/domain/createVetController.dart';

class FooterCreateVet extends StatelessWidget {
  const FooterCreateVet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return ConditionalSwitch.single<int>(
          context: context,
          valueBuilder: (BuildContext context) => _.v.selected,
          caseBuilders: {
            // 0: (BuildContext context) => EventsBooking(),
            1: (BuildContext context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    btnAltern(
                      bold: true,
                      text: 'Salir',
                      onPressed: () => Get.back(),
                    ),
                    btnAltern(
                      bold: true,
                      text: 'Continuar',
                      onPressed: () => _.validaStep1(),
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
                        if (_.v.selected > 1) _.v.selected--;
                      },
                    ),
                    // btnAltern(
                    //   bold: true,
                    //   text: 'Continuar - deprecated',
                    //   onPressed: () {
                    //     if (_.v.selected < 4) _.v.selected++;
                    //   },
                    // ),
                  ],
                ),
            3: (BuildContext context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    btnAltern(
                      bold: true,
                      text: 'Salir',
                      onPressed: () => Get.back(),
                    ),
                    btnAltern(
                      bold: true,
                      text: 'Continuar',
                      onPressed: () {
                        if (_.v.selected < 4) _.v.selected++;
                      },
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
                        if (_.v.selected > 1) _.v.selected--;
                      },
                    ),
                    btnAltern(
                      bold: true,
                      text: 'Finalizar',
                      color: colorMain,
                      onPressed: () {
                        _.v.checked = true;
                        Timer(
                          Duration(milliseconds: 3500),
                          () {
                            _.v.checked = false;
                            Get.offNamed(NameRoutes.establishments);
                          },
                        );
                      },
                    ),
                  ],
                ),
          },
          fallbackBuilder: (BuildContext context) => SizedBox(height: 0),
        );
      },
    );
  }
}
