import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vet_app/assets/images/lotties.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';
import 'package:vet_app/src/establishments/view/_children/create/shared/components/numStep.dart';

import 'bodyAddVet.dart';

class CreaVetView extends StatelessWidget {
  const CreaVetView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: NumStep(),
            title: Text('Crea establecimiento'),
            centerTitle: false,
          ),
          body: _.v.checked
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        lottieCheck,
                        fit: BoxFit.cover,
                        height: 120,
                        repeat: false,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Registro exitoso!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: colorMain,
                        ),
                      ),
                    ],
                  ),
                )
              : BodyAddVet(),
        );
      },
    );
  }
}
