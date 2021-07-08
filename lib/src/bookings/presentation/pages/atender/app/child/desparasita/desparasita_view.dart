import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vet_app/src/bookings/data/model/booking/deworming_booking.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';

class DesparasitaView extends StatefulWidget {
  @override
  _DesparasitaViewState createState() => _DesparasitaViewState();
}

class _DesparasitaViewState extends State<DesparasitaView> {
  RxBool recomendaciones = false.obs;
  final desparasitaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      builder: (_book) {
        // final listaDesparasita =
        //     _book.desparasita.value?.dewormers ?? <Dewormer>[];

        final recomendationController = TextEditingController(
            text: _book.desparasita.value?.recommendations ?? '');

        final amountController = MoneyMaskedTextController(
          initialValue: _book.desparasita.value?.amount ?? 0,
          decimalSeparator: '.',
          thousandSeparator: ',',
        );

        return Scaffold(
          appBar: AppBar(
            title: const Text('Desparasitación'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    TypeAheadField<Dewormer>(
                      suggestionsCallback: (filter) async {
                        final url = Uri.https(
                          urlBase!,
                          '/autocomplete/dewormings',
                          {'q': filter},
                        );
                        final response = await http.get(url);
                        final models = dewormingsModelFromJson(response.body);
                        return models;
                        // filter.trim()=='' ? [] : models;
                      },
                      onSuggestionSelected: (Dewormer data) {
                        var doble = false;

                        for (var element in _book.listDeworming) {
                          if (element.id == data.id) doble = true;
                        }

                        if (!doble) {
                          _book.listDeworming.add(data);
                          desparasitaController.clear();
                        }
                      },
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: desparasitaController,
                        decoration: const InputDecoration(
                            labelText: 'Busque desparasitación'),
                      ),
                      noItemsFoundBuilder: (context) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('No se encontró'),
                      ),
                      itemBuilder: (context, address) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          address.name!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var item in _book.listDeworming)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 16) *
                                        (7 / 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 16) *
                                        (1 / 8),
                                child: InkWell(
                                  onTap: () {
                                    _book.listDeworming.remove(item);
                                  },
                                  child: const Icon(Icons.delete_rounded),
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      decoration: const InputDecoration(
                        labelText: 'Monto desparasitación',
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.maxFinite,
                      child: btnPrimary(
                        text: 'Guardar',
                        onPressed: () {
                          if (_book.listDeworming.isNotEmpty &&
                              amountController.numberValue > 0) {
                            final temp = DewormingBooking(
                              amount: amountController.numberValue,
                              recommendations: recomendationController.text,
                              dewormers: _book.listDeworming,
                            );
                            _book.saveDesparasitacion(temp);
                          } else {
                            ScaffoldMessenger.of(Get.context!)
                                .showSnackBar(SnackBar(
                              content: const Text(
                                  'Falta ingresar desparasitación o monto'),
                              duration: const Duration(seconds: 3),
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
