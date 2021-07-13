import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/bookings/data/model/booking/surgery_booking.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';

class CirugiaView extends StatefulWidget {
  @override
  _CirugiaViewState createState() => _CirugiaViewState();
}

class _CirugiaViewState extends State<CirugiaView> {
  RxBool recomendaciones = false.obs;
  final recomendationController = TextEditingController(
    text: Get.find<BookingController>().cirugia.value?.recommendations ?? '',
  );

  final amountController = MoneyMaskedTextController(
    initialValue: Get.find<BookingController>().cirugia.value?.amount ?? 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      builder: (_book) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cirugía'),
            actions: [
              IconButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('Eliminar'),
                      content: const Text(
                          'Seguro que desea eliminar esta atención?'),
                      actions: <Widget>[
                        btnAltern(
                          text: 'Cancelar',
                          onPressed: () => Get.back(),
                        ),
                        btnAltern(
                          text: 'Eliminar',
                          onPressed: () {
                            _book.deleteCirugia();
                            Get.close(2);
                          },
                          color: colorRed,
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete_rounded),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recomendaciones',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            icon: Icon(!recomendaciones.value
                                ? Icons.add_circle_rounded
                                : Icons.remove_circle_rounded),
                            onPressed: () {
                              recomendaciones.value = !recomendaciones.value;
                            }),
                      ],
                    ),
                    if (recomendaciones.value)
                      TextFormField(
                        maxLines: 5,
                        controller: recomendationController,
                      )
                    else
                      const SizedBox(height: 0),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 5),
                child: Column(
                  children: [
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Monto cirugía',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: btnPrimary(
                          text: 'Guardar',
                          onPressed: () {
                            if (amountController.numberValue > 0) {
                              final temp = SurgeryBooking(
                                amount: amountController.numberValue,
                                recommendations: recomendationController.text,
                              );
                              _book.saveCirugia(temp);
                            } else {
                              ScaffoldMessenger.of(Get.context!)
                                  .showSnackBar(SnackBar(
                                content: const Text('Ingrese monto'),
                                duration: const Duration(seconds: 3),
                                backgroundColor: Colors.black.withOpacity(0.85),
                              ));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
