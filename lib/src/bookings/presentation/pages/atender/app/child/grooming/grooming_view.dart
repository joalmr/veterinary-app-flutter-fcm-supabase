import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/bookings/data/model/booking/grooming_booking.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';
import 'package:vet_app/src/bookings/domain/json/json_grooming.dart';

class GroomingView extends StatefulWidget {
  @override
  _GroomingViewState createState() => _GroomingViewState();
}

class _GroomingViewState extends State<GroomingView> {
  RxBool recommendations = false.obs;

  final recommendationController = TextEditingController(
      // text:Get.find<BookingController>().grooming.value?.recommendations ?? ''
      );

  final amountController = MoneyMaskedTextController(
    initialValue: 0,
    // Get.find<BookingController>().grooming.value?.amount == null
    //     ? 0
    //     : Get.find<BookingController>().grooming.value!.amount!,
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  var listaGrooming = [];

  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Grooming'),
          actions: [
            IconButton(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: Text('Eliminar'),
                    content: Text('Seguro que desea eliminar esta atención?'),
                    actions: <Widget>[
                      btnAltern(
                        text: 'Cancelar',
                        onPressed: () => Get.back(),
                      ),
                      btnAltern(
                        text: 'Eliminar',
                        onPressed: () {
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
                padding: EdgeInsets.symmetric(horizontal: 8),
                children: [
                  Wrap(
                    children: [
                      for (var item in listaDatosGrooming)
                        InkWell(
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: () {
                            if (_.listaGroomingsIds.contains(item.id)) {
                              _.listaGroomingsIds.remove(item.id);
                              _.listaGroomingsNames.remove(item.name);
                            } else {
                              _.listaGroomingsIds.add(item.id!);
                              _.listaGroomingsNames.add(item.name!);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 1.5),
                            decoration: BoxDecoration(
                              color: _.listaGroomingsIds.contains(item.id)
                                  ? colorMain[900]
                                  : Colors.black38,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                item.name!,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recomendaciones',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          icon: Icon(!recommendations.value
                              ? Icons.add_circle_rounded
                              : Icons.remove_circle_rounded),
                          onPressed: () {
                            recommendations.value = !recommendations.value;
                          }),
                    ],
                  ),
                  if (recommendations.value)
                    TextFormField(
                      maxLines: 5,
                      controller: recommendationController,
                    )
                  else
                    SizedBox(height: 0),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
              child: Column(
                children: [
                  TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Monto grooming',
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: btnPrimary(
                        text: 'Guardar',
                        onPressed: () {
                          //guarda grooming
                          if (_.listaGroomingsIds.isNotEmpty &&
                              amountController.numberValue > 0) {
                            final temp = GroomingBooking(
                              amount: amountController.numberValue,
                              recommendations: recommendationController.text,
                              groomingIds: _.listaGroomingsIds,
                              groomings: _.listaGroomingsNames,
                            );
                            _.saveGrooming(temp);
                          } else {
                            ScaffoldMessenger.of(Get.context!).showSnackBar(
                              SnackBar(
                                content: const Text(
                                    'Falta ingresar servicio o monto'),
                                duration: const Duration(seconds: 3),
                                backgroundColor: Colors.black.withOpacity(0.85),
                              ),
                            );
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
    });
  }
}
