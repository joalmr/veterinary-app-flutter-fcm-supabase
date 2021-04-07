import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/recursos/images/lotties.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:lottie/lottie.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/components/bodyStep.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/components/headerStep.dart';

class AddVet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return _.checked
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      lottieCheck,
                      fit: BoxFit.cover,
                      height: context.width > 900 ? 320 : 120,
                      repeat: false,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Registro exitoso!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.width > 900 ? 32 : 22,
                        color: colorMain,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        // NumStep(selected: selected),
                        SizedBox(width: 20),
                        HeaderStep(selected: _.selected),
                        Container(
                          width: 100,
                          child: _.selected > 1
                              ? btnAltern(
                                  bold: true,
                                  text: 'Volver',
                                  onPressed: () {
                                    if (_.selected > 1) _.selected--;
                                  },
                                )
                              : null,
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 100,
                          child: _.selected < 4
                              ? btnAltern(
                                  bold: true,
                                  text: 'Siguiente',
                                  onPressed: () {
                                    switch (_.selected) {
                                      case 1:
                                        print(_.selected);
                                        break;
                                      case 2:
                                        print(_.selected);
                                        break;
                                      case 3:
                                        print(_.selected);
                                        break;
                                      case 4:
                                        print(_.selected);
                                        break;
                                    }
                                    if (_.selected < 4) _.selected++;
                                  },
                                )
                              : btnAltern(
                                  bold: true,
                                  text: 'Finalizar',
                                  color: colorMain,
                                  onPressed: () {
                                    _.checked = true;
                                    Timer(
                                      Duration(milliseconds: 3000),
                                      () {
                                        _.checked = false;
                                        Get.toNamed('/establishments/show');
                                      },
                                    );
                                  },
                                ),
                        ),
                        SizedBox(width: 60),
                      ],
                    ),
                  ),
                  BodyStep(selected: _.selected),
                  SizedBox(height: 0),
                ],
              );
      },
    );
  }
}
