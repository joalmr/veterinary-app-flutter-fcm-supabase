import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/stablishments/domain/createVetController.dart';
import 'components/bodyStep.dart';
import 'components/headerStep.dart';

class BodyAddVet extends StatelessWidget {
  const BodyAddVet({Key key}) : super(key: key);

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
                  HeaderStep(selected: _.v.selected),
                ],
              ),
            ),
            BodyStep(selected: _.v.selected),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  child: _.v.selected == 2 || _.v.selected == 4
                      ? btnAltern(
                          bold: true,
                          text: 'Volver',
                          onPressed: () {
                            if (_.v.selected > 1) _.v.selected--;
                          },
                        )
                      : _.v.selected == 1 || _.v.selected == 3
                          ? btnAltern(
                              bold: true,
                              text: 'Salir',
                              onPressed: () => Get.back(),
                            )
                          : SizedBox(height: 0),
                ),
                Container(
                  width: 100,
                  height: 50,
                  child: _.v.selected == 1 ||
                          _.v.selected == 2 ||
                          _.v.selected == 3
                      ? btnAltern(
                          bold: true,
                          text: 'Continuar',
                          onPressed: () {
                            switch (_.v.selected) {
                              case 1:
                                print(_.v.selected);
                                break;
                              case 3:
                                print(_.v.selected);
                                break;
                            }
                            if (_.v.selected < 4) _.v.selected++;
                          },
                        )
                      : _.v.selected == 2
                          ? SizedBox(height: 0)
                          : btnAltern(
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
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
