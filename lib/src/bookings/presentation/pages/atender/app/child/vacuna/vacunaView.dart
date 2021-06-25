import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vet_app/src/bookings/data/model/vaccinesModel.dart';

class VacunaView extends StatefulWidget {
  @override
  _VacunaViewState createState() => _VacunaViewState();
}

class _VacunaViewState extends State<VacunaView> {
  bool anamnesis = false;
  bool recomendaciones = false;

  final vacunaController = TextEditingController();
  var listaVacuna = <VaccinesModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacuna'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8),
              children: [
                TypeAheadField<VaccinesModel>(
                  // hideOnLoading: true,
                  suggestionsCallback: (filter) async {
                    final url = Uri.https(
                      urlBase,
                      '/autocomplete/vaccines',
                      {"q": filter},
                    );
                    var response = await http.get(url);
                    var models = vaccinesModelFromJson(response.body);
                    return models;
                    // filter.trim()=='' ? [] : models;
                  },
                  onSuggestionSelected: (VaccinesModel data) {
                    var doble = false;
                    listaVacuna.forEach((element) {
                      if (element.id == data.id) doble = true;
                    });
                    if (!doble) {
                      setState(() {
                        print(jsonEncode(data));
                        listaVacuna.add(data);
                      });
                      vacunaController.clear();
                    }
                  },
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: vacunaController,
                    decoration: InputDecoration(labelText: 'Busque vacuna'),
                  ),
                  noItemsFoundBuilder: (context) => Padding(
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
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var item in listaVacuna)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 16) *
                                (7 / 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 16) *
                                (1 / 8),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  listaVacuna.remove(item);
                                });
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
                        icon: Icon(!recomendaciones
                            ? Icons.add_circle_rounded
                            : Icons.remove_circle_rounded),
                        onPressed: () {
                          setState(() {
                            recomendaciones = !recomendaciones;
                          });
                        }),
                  ],
                ),
                recomendaciones
                    ? TextFormField(
                        maxLines: 5,
                      )
                    : SizedBox(height: 0),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Monto vacuna',
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                    width: double.maxFinite,
                    child: btnPrimary(text: 'Guardar', onPressed: () {})),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
