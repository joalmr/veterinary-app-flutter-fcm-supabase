import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/images/lotties.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';

import 'package:lottie/lottie.dart';

import 'addVet/components/bodyStep.dart';
import 'addVet/components/headerStep.dart';
import 'addVet/components/numStep.dart';

class AddVet extends StatefulWidget {
  const AddVet({Key key}) : super(key: key);

  @override
  _AddVetState createState() => _AddVetState();
}

int selected = 1;
bool checked = false;

class _AddVetState extends State<AddVet> {
  @override
  Widget build(BuildContext context) {
    return checked
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
                padding: EdgeInsets.only(
                  left: context.width > 900 ? 20 : 10,
                  top: 5,
                  bottom: 5,
                ),
                child: context.width > 900
                    ? Row(
                        children: [
                          NumStep(selected: selected),
                          SizedBox(width: 20),
                          HeaderStep(selected: selected),
                          Container(
                            width: 100,
                            child: selected > 1
                                ? btnAltern(
                                    bold: true,
                                    text: 'Volver',
                                    onPressed: () {
                                      if (selected > 1)
                                        setState(() {
                                          selected--;
                                        });
                                    },
                                  )
                                : null,
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: 100,
                            child: selected < 4
                                ? btnAltern(
                                    bold: true,
                                    text: 'Siguiente',
                                    onPressed: () {
                                      switch (selected) {
                                        case 1:
                                          print(selected);
                                          break;
                                        case 2:
                                          print(selected);
                                          break;
                                        case 3:
                                          print(selected);
                                          break;
                                        case 4:
                                          print(selected);
                                          break;
                                      }
                                      if (selected < 4)
                                        setState(() {
                                          selected++;
                                        });
                                    },
                                  )
                                : btnAltern(
                                    bold: true,
                                    text: 'Finalizar',
                                    color: colorMain,
                                    onPressed: () {
                                      setState(() {
                                        checked = true;
                                        Timer(
                                          Duration(milliseconds: 3000),
                                          () {
                                            setState(() {
                                              checked = false;
                                            });
                                            Get.toNamed('/stablishments/show');
                                          },
                                        );
                                      });
                                    },
                                  ),
                          ),
                          SizedBox(width: 60),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NumStep(selected: selected),
                          SizedBox(width: 20),
                          HeaderStep(selected: selected),
                        ],
                      ),
              ),
              BodyStep(selected: selected),
              context.width > 900
                  ? SizedBox(height: 0)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          child: selected == 2 || selected == 4
                              ? btnAltern(
                                  bold: true,
                                  text: 'Volver',
                                  onPressed: () {
                                    if (selected > 1)
                                      setState(() {
                                        selected--;
                                      });
                                  },
                                )
                              : selected == 1 || selected == 3
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
                          child: selected == 1 || selected == 2 || selected == 3
                              ? btnAltern(
                                  bold: true,
                                  text: 'Continuar',
                                  onPressed: () {
                                    switch (selected) {
                                      case 1:
                                        print(selected);
                                        break;
                                      case 3:
                                        print(selected);
                                        break;
                                    }
                                    if (selected < 4)
                                      setState(() {
                                        selected++;
                                      });
                                  },
                                )
                              : selected == 2
                                  ? SizedBox(height: 0)
                                  : btnAltern(
                                      bold: true,
                                      text: 'Finalizar',
                                      color: colorMain,
                                      onPressed: () {
                                        setState(() {
                                          checked = true;
                                          Timer(
                                            Duration(milliseconds: 3500),
                                            () {
                                              setState(() {
                                                checked = false;
                                              });
                                              Get.offNamed('/stablishments');
                                            },
                                          );
                                        });
                                      },
                                    ),
                        ),
                      ],
                    ),
            ],
          );
  }
}
