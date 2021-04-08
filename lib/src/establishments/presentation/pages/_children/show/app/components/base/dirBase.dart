import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/establishments/data/model/prediction.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/src/establishments/domain/edit/editBaseController.dart';

class DirBase extends StatelessWidget {
  final String direccion;
  final TextEditingController controller;
  const DirBase({@required this.direccion, @required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditBaseController>(
      builder: (_) {
        return SimpleAutocompleteFormField<Prediction>(
          controller: controller,
          maxSuggestions: 3,
          decoration: InputDecoration(labelText: 'Dirección'),
          onSearch: (filter) async {
            String ruta =
                "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter";
            Uri url = Uri.parse(ruta);
            var response = await http.get(url);
            var models = addressFromJson(response.body);
            return models.predictions;
          },
          minSearchLength: 2,
          onChanged: (Prediction data) =>
              (data != null) ? _.gpsDireccion(data) : null,
          resetIcon: null,
          itemBuilder: (context, address) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 8.0,
            ),
            child: Text(
              address.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
