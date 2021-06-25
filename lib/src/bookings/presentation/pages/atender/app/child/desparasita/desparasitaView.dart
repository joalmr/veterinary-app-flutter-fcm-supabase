import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vet_app/src/bookings/data/model/booking/dewormingBooking.dart';
import 'package:vet_app/src/bookings/domain/bookingController.dart';

class DesparasitaView extends StatefulWidget {
  @override
  _DesparasitaViewState createState() => _DesparasitaViewState();
}

class _DesparasitaViewState extends State<DesparasitaView> {
  bool anamnesis = false;
  bool recomendaciones = false;

  final desparasitaController = TextEditingController();
  var listaDesparasita = <Dewormer>[];

  final recomendationController = TextEditingController();

  final amountController = new MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
    leftSymbol: '',
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      builder: (_book) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Desparasitación'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    TypeAheadField<Dewormer>(
                      // hideOnLoading: true,
                      suggestionsCallback: (filter) async {
                        final url = Uri.https(
                          urlBase,
                          '/autocomplete/dewormings',
                          {"q": filter},
                        );
                        var response = await http.get(url);
                        var models = dewormingsModelFromJson(response.body);
                        return models;
                        // filter.trim()=='' ? [] : models;
                      },
                      onSuggestionSelected: (Dewormer data) {
                        var doble = false;
                        listaDesparasita.forEach((element) {
                          if (element.id == data.id) doble = true;
                        });
                        if (!doble) {
                          setState(() {
                            print(jsonEncode(data));
                            listaDesparasita.add(data);
                          });
                          desparasitaController.clear();
                        }
                      },
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: desparasitaController,
                        decoration: InputDecoration(
                            labelText: 'Busque desparasitación'),
                      ),
                      noItemsFoundBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('No se encontró'),
                      ),
                      itemBuilder: (context, address) => Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          address.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var item in listaDesparasita)
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
                                      item.name,
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
                                      listaDesparasita.remove(item);
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
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: 'Monto desparasitación',
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.maxFinite,
                      child: btnPrimary(
                        text: 'Guardar',
                        onPressed: () {
                          print('llega desparasita');
                          if (listaDesparasita.length > 0 &&
                              amountController.numberValue > 0) {
                            final temp = DewormingBooking(
                              amount: amountController.numberValue,
                              recommendations: recomendationController.text,
                              dewormers: listaDesparasita,
                            );
                            _book.saveDesparasitacion(temp);
                          } else {
                            ScaffoldMessenger.of(Get.context)
                                .showSnackBar(SnackBar(
                              content: Text(
                                  'Falta ingresar desparasitación o monto'),
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
