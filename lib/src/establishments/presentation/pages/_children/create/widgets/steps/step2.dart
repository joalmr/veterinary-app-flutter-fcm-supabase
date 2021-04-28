import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/establishments/data/model/prediction.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/components/map.dart';

class Step2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVetController>(
      builder: (_) {
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              SizedBox(height: 5),
              TypeAheadField<Prediction>(
                suggestionsCallback: (filter) async {
                  String ruta =
                      "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter";
                  Uri url = Uri.parse(ruta);
                  var response = await http.get(url);
                  print(response.body);
                  var models = addressFromJson(response.body);
                  return models.predictions;
                },
                onSuggestionSelected: (Prediction data) => (data != null) ? _.gpsDireccion(data) : null,
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _.v.dirVet,
                  decoration: InputDecoration(labelText: 'Dirección'),
                ),
                noItemsFoundBuilder: (context)=>Padding(
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
              // SimpleAutocompleteFormField<Prediction>(
              //   decoration: InputDecoration(labelText: 'Dirección'),
              //   controller: _.v.dirVet,
              //   maxSuggestions: 3,
              //   onSearch: (filter) async {
              //     String ruta =
              //         "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter";
              //     Uri url = Uri.parse(ruta);
              //     var response = await http.get(url);
              //     print(response.body);
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
              // ),
              SizedBox(height: 5),
              Container(
                height: 400,
                child: MapVet(),
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(labelText: 'Referencia'),
                textCapitalization: TextCapitalization.sentences,
              ),
              SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
