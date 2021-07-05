import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/bookings/data/model/booking/surgery_booking.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';

class CirugiaView extends StatefulWidget {
  @override
  _CirugiaViewState createState() => _CirugiaViewState();
}

class _CirugiaViewState extends State<CirugiaView> {
  RxBool recomendaciones = false.obs;

  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      builder: (_book) {
        final recomendationController = TextEditingController(
            text: _book.cirugia.value?.recommendations ?? '');

        final amountController = new MoneyMaskedTextController(
          initialValue: _book.cirugia.value?.amount ?? 0,
          decimalSeparator: '.',
          thousandSeparator: ',',
          precision: 2,
          leftSymbol: '',
        );

        return Scaffold(
          appBar: AppBar(
            title: Text('Cirugía'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
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
                    recomendaciones.value
                        ? TextFormField(
                            maxLines: 5,
                            controller: recomendationController,
                          )
                        : SizedBox(height: 0),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
                child: Column(
                  children: [
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Monto cirugía',
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.maxFinite,
                      child: btnPrimary(
                        text: 'Guardar',
                        onPressed: () {
                          print('llega cirugia');
                          if (amountController.numberValue > 0) {
                            final temp = SurgeryBooking(
                              amount: amountController.numberValue,
                              recommendations: recomendationController.text,
                            );
                            _book.saveCirugia(temp);
                          } else {
                            ScaffoldMessenger.of(Get.context!)
                                .showSnackBar(SnackBar(
                              content: Text('Ingrese monto'),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.black.withOpacity(0.85),
                            ));
                          }
                        },
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
