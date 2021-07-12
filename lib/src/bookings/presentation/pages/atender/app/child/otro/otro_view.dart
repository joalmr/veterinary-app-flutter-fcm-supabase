import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vet_app/design/styles/styles.dart';
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
        // var listaOtro = _book.otros.value?.others ?? <OtherServ>[];

        final recomendationController = TextEditingController(
            text: _book.otros.value?.recommendations ?? '');

        final amountController = MoneyMaskedTextController(
          initialValue: _book.otros.value?.amount ?? 0,
          decimalSeparator: '.',
          thousandSeparator: ',',
        );

        return Scaffold(
          appBar: AppBar(
            title: const Text('Otros'),
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
                          onPressed: () {},
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
                    TypeAheadField<OtherServ>(
                      suggestionsCallback: (filter) async {
                        final url = Uri.https(
                          urlBase!,
                          '/autocomplete/others',
                          {'q': filter},
                        );
                        final response = await http.get(url);
                        final models = otherServModelFromJson(response.body);
                        return models;
                      },
                      onSuggestionSelected: (OtherServ data) {
                        var doble = false;

                        for (var element in _book.listOthers) {
                          if (element.id == data.id) doble = true;
                        }

                        if (!doble) {
                          _book.listOthers.add(data);
                          otroController.clear();
                        }
                      },
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: otroController,
                        decoration: const InputDecoration(
                            labelText: 'Busque otro servicio'),
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
                        for (var item in _book.listOthers)
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
                                    _book.listOthers.remove(item);
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
                        labelText: 'Monto otros',
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.maxFinite,
                      child: btnPrimary(
                        text: 'Guardar',
                        onPressed: () {
                          if (_book.listOthers.isNotEmpty &&
                              amountController.numberValue > 0) {
                            final temp = OthersBooking(
                              amount: amountController.numberValue,
                              recommendations: recomendationController.text,
                              others: _book.listOthers,
                            );
                            _book.saveOtro(temp);
                          } else {
                            ScaffoldMessenger.of(Get.context!)
                                .showSnackBar(SnackBar(
                              content:
                                  const Text('Falta ingresar servicio o monto'),
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
