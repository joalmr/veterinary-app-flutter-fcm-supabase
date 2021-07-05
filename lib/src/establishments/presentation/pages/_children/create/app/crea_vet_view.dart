import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/create/create_vet_controller.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/num_step.dart';

import 'body_add_vet.dart';

class CreaVetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: NumStep(),
            title: const Text('Crea establecimiento'),
          ),
          body: _.checked
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : BodyAddVet(),
        );
      },
    );
  }
}

//     Lottie.asset(
//       lottieLoading,
//       fit: BoxFit.cover,
//       height: 120,
//       repeat: false,
//     ),
