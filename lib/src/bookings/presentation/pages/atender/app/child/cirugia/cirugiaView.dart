import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/bookings/data/model/booking/surgeryBooking.dart';
import 'package:vet_app/src/bookings/domain/bookingController.dart';

class CirugiaView extends StatefulWidget {
  @override
  _CirugiaViewState createState() => _CirugiaViewState();
}

class _CirugiaViewState extends State<CirugiaView> {
  // bool anamnesis = false;
  bool recomendaciones = false;

  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      builder: (_book) {
        final recomendationController = TextEditingController(
          text: _book.cirugia.value.recommendations ?? ''
        );

        final amountController = new MoneyMaskedTextController(
          initialValue: _book.cirugia.value.amount ?? 0,
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
                            icon: Icon(!recomendaciones
                                ? Icons.add_circle_rounded
                                : Icons.remove_circle_rounded),
                            onPressed: () {
                              setState(() {
                                recomendaciones = !recomendaciones;
                              });
                            }),
                      ],
                    ),
                    recomendaciones
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
                            ScaffoldMessenger.of(Get.context)
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
