import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/src/establishments/data/model/prediction.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/map.dart';

class Step2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVetController>(
      builder: (_) {
        return SizedBox(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              const SizedBox(height: 5),
              TypeAheadField<Prediction>(
                suggestionsCallback: (filter) async {
                  final String ruta =
                      'https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter';
                  final Uri url = Uri.parse(ruta);
                  final response = await http.get(url);

                  final models = addressFromJson(response.body);
                  return models.predictions!;
                },
                onSuggestionSelected: (Prediction? data) =>
                    (data != null) ? _.gpsDireccion(data) : null,
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _.v.dirVet,
                  decoration: const InputDecoration(labelText: 'Dirección'),
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
              const SizedBox(height: 5),
              const SizedBox(
                height: 400,
                child: MapVet(),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Referencia'),
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
