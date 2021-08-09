import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/bookings/data/model/booking/consultation_booking.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';
import 'package:vet_app/src/home/presentation/pages/web/dashboard/widgets/tab_select.dart';
import 'radio_consulta.dart';

class ConsultaView extends StatelessWidget {
  final diagnosticoController = TextEditingController();

  final anamnesisController = TextEditingController(
    text: Get.find<BookingController>().consulta.value?.anamnesis ?? '',
  );
  final recomendationController = TextEditingController(
    text: Get.find<BookingController>().consulta.value?.recommendations ?? '',
  );

  final amountController = MoneyMaskedTextController(
    initialValue: Get.find<BookingController>().consulta.value?.amount ?? 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  final List<String> type = [
    'Consulta',
    'Chequeo preventivo',
    'Tratamiento',
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Consulta'),
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
                          onPressed: () {
                            _.deleteConsulta();
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    Text(
                      'Tipo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              _.selectedTypeConsultation.value = 0;
                            },
                            child: tabSelect(
                              selected: _.selectedTypeConsultation.value == 0,
                              text: 'Consulta',
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              _.selectedTypeConsultation.value = 1;
                            },
                            child: tabSelect(
                              selected: _.selectedTypeConsultation.value == 1,
                              text: 'Chequeo preventivo',
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              _.selectedTypeConsultation.value = 2;
                            },
                            child: tabSelect(
                              selected: _.selectedTypeConsultation.value == 2,
                              text: 'Tratamiento',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TypeAheadField<Diagnosis>(
                      suggestionsCallback: (filter) async {
                        final url = Uri.https(
                          urlBase!,
                          '/autocomplete/diagnoses',
                          {'q': filter},
                        );
                        final response = await http.get(url);
                        final models = diagnosesModelFromJson(response.body);
                        return models; //filter.trim() == '' ? [] : models;
                      },
                      onSuggestionSelected: (Diagnosis data) {
                        var doble = false;

                        for (var element in _.listaDiagnostico) {
                          if (element.id == data.id) doble = true;
                        }

                        if (!doble) {
                          _.listaDiagnostico.add(data);
                          diagnosticoController.clear();
                        }
                      },
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: diagnosticoController,
                        decoration: const InputDecoration(
                            labelText: 'Busque diagnósticos'),
                      ),
                      noItemsFoundBuilder: (context) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('No se encontró'),
                      ),
                      itemBuilder: (context, dato) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          dato.name!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var item in _.listaDiagnostico)
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
                                    RadioConsulta(
                                      selectValue:
                                          item.condition ?? 'Presumptive',
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
                                    _.listaDiagnostico.remove(item);
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
                    if (_.anamnesisBoolConsulta.value)
                      TextFormField(
                        maxLines: 5,
                        controller: anamnesisController,
                      )
                    else
                      const SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
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
                    if (_.recomendacionesBoolConsulta.value)
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
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Monto consulta',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: btnPrimary(
                          text: 'Guardar',
                          onPressed: () {
                            if (_.listaDiagnostico.isNotEmpty &&
                                amountController.numberValue > 0) {
                              final temp = ConsultationBooking(
                                amount: amountController.numberValue,
                                anamnesis: anamnesisController.text,
                                diagnoses: _.listaDiagnostico,
                                recommendations: recomendationController.text,
                                type: type[_.selectedTypeConsultation.value],
                              );
                              _.saveConsulta(temp);
                            } else {
                              ScaffoldMessenger.of(Get.context!).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                      'Falta ingresar monto o diagnóstico'),
                                  duration: const Duration(seconds: 3),
                                  backgroundColor:
                                      Colors.black.withOpacity(0.85),
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
      },
    );
  }
}
