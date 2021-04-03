import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/images/lotties.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:lottie/lottie.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/components/bodyStep.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/components/headerStep.dart';

class AddVet extends StatelessWidget {
  const AddVet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return _.v.checked
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
                        HeaderStep(selected: _.v.selected),
                        Container(
                          width: 100,
                          child: _.v.selected > 1
                              ? btnAltern(
                                  bold: true,
                                  text: 'Volver',
                                  onPressed: () {
                                    if (_.v.selected > 1) _.v.selected--;
                                  },
                                )
                              : null,
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 100,
                          child: _.v.selected < 4
                              ? btnAltern(
                                  bold: true,
                                  text: 'Siguiente',
                                  onPressed: () {
                                    switch (_.v.selected) {
                                      case 1:
                                        print(_.v.selected);
                                        break;
                                      case 2:
                                        print(_.v.selected);
                                        break;
                                      case 3:
                                        print(_.v.selected);
                                        break;
                                      case 4:
                                        print(_.v.selected);
                                        break;
                                    }
                                    if (_.v.selected < 4) _.v.selected++;
                                  },
                                )
                              : btnAltern(
                                  bold: true,
                                  text: 'Finalizar',
                                  color: colorMain,
                                  onPressed: () {
                                    _.v.checked = true;
                                    Timer(
                                      Duration(milliseconds: 3000),
                                      () {
                                        _.v.checked = false;
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
                  BodyStep(selected: _.v.selected),
                  SizedBox(height: 0),
                ],
              );
      },
    );
  }
}
