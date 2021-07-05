import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vet_app/src/bookings/data/model/booking/others_booking.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';

class OtroView extends StatefulWidget {
  @override
  _OtroViewState createState() => _OtroViewState();
}

class _OtroViewState extends State<OtroView> {
  RxBool recomendaciones = false.obs;
  final otroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      builder: (_book) {
        var listaOtro = _book.otros.value?.others ?? <OtherServ>[];

        final recomendationController = TextEditingController(
            text: _book.otros.value?.recommendations ?? '');

        final amountController = new MoneyMaskedTextController(
          initialValue: _book.otros.value?.amount ?? 0,
          decimalSeparator: '.',
          thousandSeparator: ',',
          precision: 2,
          leftSymbol: '',
        );

        return Scaffold(
          appBar: AppBar(
            title: Text('Otros'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    TypeAheadField<OtherServ>(
                      suggestionsCallback: (filter) async {
                        final url = Uri.https(
                          urlBase!,
                          '/autocomplete/others',
                          {'q': filter},
                        );
                        var response = await http.get(url);
                        var models = otherServModelFromJson(response.body);
                        return models; //filter.trim() == '' ? [] : models;
                      },
                      onSuggestionSelected: (OtherServ data) {
                        var doble = false;
                        listaOtro.forEach((element) {
                          if (element.id == data.id) doble = true;
                        });
                        if (!doble) {
                          setState(() {
                            print(jsonEncode(data));
                            listaOtro.add(data);
                          });
                          otroController.clear();
                        }
                      },
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: otroController,
                        decoration:
                            InputDecoration(labelText: 'Busque otro servicio'),
                      ),
                      noItemsFoundBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('No se encontró'),
                      ),
                      itemBuilder: (context, address) => Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          address.name!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var item in listaOtro)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width - 16) *
                                        (7 / 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width - 16) *
                                        (1 / 8),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      listaOtro.remove(item);
                                    });
                                  },
                                  child: Icon(Icons.delete_rounded),
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                    SizedBox(height: 10),
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
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: 'Monto otros',
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.maxFinite,
                      child: btnPrimary(
                        text: 'Guardar',
                        onPressed: () {
                          print('llega otro');
                          if (listaOtro.length > 0 &&
                              amountController.numberValue > 0) {
                            final temp = OthersBooking(
                              amount: amountController.numberValue,
                              recommendations: recomendationController.text,
                              others: listaOtro,
                            );
                            _book.saveOtro(temp);
                          } else {
                            ScaffoldMessenger.of(Get.context!)
                                .showSnackBar(SnackBar(
                              content: Text('Falta ingresar servicio o monto'),
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
