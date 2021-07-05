import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';

class VacunaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Vacuna'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    child: Stepper(
                      currentStep: 0,
                      steps: [
                        Step(
                          title: const Text('Ingresar vacuna'),
                          content: Column(
                            children: [
                              const Text('blabla'),
                              // _.buscaVacuna(),
                              // Wrap(
                              //   direction: Axis.vertical,
                              //   alignment: WrapAlignment.start,
                              //   children: _.elementos
                              //       .map((item) => item)
                              //       .toList()
                              //       .cast<Widget>(),
                              // ),
                            ],
                          ),
                        ),
                        Step(
                          title: const Text('Monto'),
                          content: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Monto',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(height: 5),
                              btnPrimary(
                                  text: 'Guardar vacuna', onPressed: () {}),
                            ],
                          ),
                        ),
                      ],
                      onStepContinue: () {},
                      onStepCancel: () {},
                      controlsBuilder: (BuildContext context,
                          {VoidCallback? onStepContinue,
                          VoidCallback? onStepCancel}) {
                        // _.stepContinue = onStepContinue;
                        // _.stepCancel = onStepCancel;
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    btnAltern(
                      text: 'Atras',
                      onPressed: () {},
                      color: Colors.grey[400]!,
                    ),
                    btnAltern(
                      text: 'Siguiente',
                      onPressed: () {},
                      color: colorMain,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
