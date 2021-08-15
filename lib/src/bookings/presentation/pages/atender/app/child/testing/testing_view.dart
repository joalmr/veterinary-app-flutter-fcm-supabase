import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/snackbar.dart';
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
                            _book.deleteExamen();
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
                            InputDecoration(labelText: 'Busque exámenes'),
                      ),
                      noItemsFoundBuilder: (context) => Padding(
                        padding: EdgeInsets.all(8.0),
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
                                      style: TextStyle(
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
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: 'Monto vacuna',
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
                            if (_book.listTesting.isNotEmpty &&
                                amountController.numberValue > 0) {
                              final temp = TestingBooking(
                                amount: amountController.numberValue,
                                recommendations: recommendationController.text,
                                tests: _book.listTesting,
                              );
                              _book.saveExamenes(temp);
                            } else {
                              snackBarMessage(
                                message: 'Falta ingresar monto o examen',
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
      },
    );
  }
}
