import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/src/bookings/data/model/booking/consultationBooking.dart';
import 'package:vet_app/src/bookings/domain/bookingController.dart';
import 'radioConsulta.dart';

class ConsultaView extends StatelessWidget {
  final diagnosticoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      builder: (_) {
        final anamnesisController = TextEditingController(
          text: _.consulta.value?.anamnesis ?? '',
        );
        final recomendationController = TextEditingController(
          text: _.consulta.value?.recommendations ?? '',
        );

        final amountController = new MoneyMaskedTextController(
          initialValue: _.consulta.value?.amount ?? 0,
          decimalSeparator: '.',
          thousandSeparator: ',',
          precision: 2,
          leftSymbol: '',
        );

        return Scaffold(
          appBar: AppBar(
            title: Text('Consulta'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    Row(
                      children: [
                        Text(
                          'Tipo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TypeAheadField<Diagnosis>(
                      suggestionsCallback: (filter) async {
                        final url = Uri.https(
                          urlBase!,
                          '/autocomplete/diagnoses',
                          {'q': filter},
                        );
                        var response = await http.get(url);
                        var models = diagnosesModelFromJson(response.body);
                        return models; //filter.trim() == '' ? [] : models;
                      },
                      onSuggestionSelected: (Diagnosis data) {
                        var doble = false;
                        _.listaDiagnostico.forEach((element) {
                          if (element.id == data.id) doble = true;
                        });
                        if (!doble) {
                          _.listaDiagnostico.add(data);
                          diagnosticoController.clear();
                        }
                      },
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: diagnosticoController,
                        decoration:
                            InputDecoration(labelText: 'Busque diagnósticos'),
                      ),
                      noItemsFoundBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('No se encontró'),
                      ),
                      itemBuilder: (context, dato) => Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          dato.name!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var item in _.listaDiagnostico)
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
                                    RadioConsulta(
                                      selectValue:
                                          item.condition ?? 'Presumptive',
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
                                    _.listaDiagnostico.remove(item);
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
                          'Anamnesis',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(!_.anamnesisBoolConsulta.value
                              ? Icons.add_circle_rounded
                              : Icons.remove_circle_rounded),
                          onPressed: () {
                            _.anamnesisBoolConsulta.value =
                                !_.anamnesisBoolConsulta.value;
                          },
                        ),
                      ],
                    ),
                    _.anamnesisBoolConsulta.value
                        ? TextFormField(
                            maxLines: 5,
                            controller: anamnesisController,
                          )
                        : SizedBox(height: 0),
                    // SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recomendaciones',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(!_.recomendacionesBoolConsulta.value
                              ? Icons.add_circle_rounded
                              : Icons.remove_circle_rounded),
                          onPressed: () {
                            _.recomendacionesBoolConsulta.value =
                                !_.recomendacionesBoolConsulta.value;
                          },
                        ),
                      ],
                    ),
                    _.recomendacionesBoolConsulta.value
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
                        labelText: 'Monto consulta',
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.maxFinite,
                      child: btnPrimary(
                        text: 'Guardar',
                        onPressed: () {
                          if (_.listaDiagnostico.length > 0 &&
                              amountController.numberValue > 0) {
                            final temp = ConsultationBooking(
                              amount: amountController.numberValue,
                              anamnesis: anamnesisController.text,
                              diagnoses: _.listaDiagnostico,
                              recommendations: recomendationController.text,
                            );
                            _.saveConsulta(temp);
                          } else {
                            ScaffoldMessenger.of(Get.context!).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Falta ingresar diagnóstico o monto'),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.black.withOpacity(0.85),
                              ),
                            );
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
