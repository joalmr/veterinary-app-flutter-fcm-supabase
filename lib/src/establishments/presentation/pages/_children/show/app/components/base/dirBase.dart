import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/establishments/data/model/prediction.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/src/establishments/domain/edit/editBaseController.dart';

class DirBase extends StatelessWidget {
  final String direccion;
  final TextEditingController controller;
  const DirBase({required this.direccion, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditBaseController>(
      builder: (_) {
        return TypeAheadField<Prediction>(
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
            controller: controller,
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
        );
        // SimpleAutocompleteFormField<Prediction>(
        //   controller: controller,
        //   maxSuggestions: 3,
        //   decoration: InputDecoration(labelText: 'Dirección'),
        //   onSearch: (filter) async {
        //     String ruta =
        //         "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter";
        //     Uri url = Uri.parse(ruta);
        //     var response = await http.get(url);
        //     var models = addressFromJson(response.body);
        //     return models.predictions;
        //   },
        //   minSearchLength: 2,
        //   onChanged: (Prediction data) =>
        //       (data != null) ? _.gpsDireccion(data) : null,
        //   resetIcon: null,
        //   itemBuilder: (context, address) => Padding(
        //     padding: EdgeInsets.symmetric(
        //       vertical: 12.0,
        //       horizontal: 8.0,
        //     ),
        //     child: Text(
        //       address.name,
        //       style: TextStyle(fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // );
      },
    );
  }
}
