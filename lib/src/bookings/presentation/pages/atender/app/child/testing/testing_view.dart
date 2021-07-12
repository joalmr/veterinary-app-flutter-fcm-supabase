import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/bookings/data/model/booking/testing_booking.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';

class TestingView extends StatefulWidget {
  @override
  _TestingViewState createState() => _TestingViewState();
}

class _TestingViewState extends State<TestingView> {
  RxBool recommendations = false.obs;

  final testingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      builder: (_book) {
        // var listTesting = _book.examenes.value?.tests ?? <Test>[];

        final recommendationController = TextEditingController(
            text: _book.examenes.value?.recommendations ?? '');

        final amountController = MoneyMaskedTextController(
          initialValue: _book.examenes.value?.amount ?? 0,
          decimalSeparator: '.',
          thousandSeparator: ',',
        );

        return Scaffold(
          appBar: AppBar(
            title: Text('Exámenes'),
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
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    TypeAheadField<Test>(
                      // hideOnLoading: true,
                      suggestionsCallback: (filter) async {
                        final url = Uri.https(
                          urlBase!,
                          '/autocomplete/tests',
                          {'q': filter},
                        );
                        final response = await http.get(url);
                        final models = testsModelFromJson(response.body);
                        return models;
                      },
                      onSuggestionSelected: (Test data) {
                        var doble = false;

                        for (var element in _book.listTesting) {
                          if (element.id == data.id) doble = true;
                        }

                        if (!doble) {
                          _book.listTesting.add(data);
                          testingController.clear();
                        }
                      },
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: testingController,
                        decoration:
                            const InputDecoration(labelText: 'Busque exámenes'),
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
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var item in _book.listTesting)
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
                                    _book.listTesting.remove(item);
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
                        labelText: 'Monto vacuna',
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.maxFinite,
                      child: btnPrimary(
                        text: 'Guardar',
                        onPressed: () {
                          if (_book.listTesting.isNotEmpty &&
                              amountController.numberValue > 0) {
                            final temp = TestingBooking(
                              amount: amountController.numberValue,
                              recommendations: recommendationController.text,
                              tests: _book.listTesting,
                            );
                            _book.saveExamenes(temp);
                          } else {
                            ScaffoldMessenger.of(Get.context!)
                                .showSnackBar(SnackBar(
                              content:
                                  const Text('Falta ingresar examen o monto'),
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
