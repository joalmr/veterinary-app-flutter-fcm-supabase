import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vet_app/src/establishments/data/model/prediction.dart';

class DesparasitaView extends StatefulWidget {
  @override
  _DesparasitaViewState createState() => _DesparasitaViewState();
}

class _DesparasitaViewState extends State<DesparasitaView> {
  bool anamnesis = false;
  bool recomendaciones = false;
  
  final desparasitaController = TextEditingController();
  var listaDesparasita = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Desparasitación'),),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8),
              children: [
                TypeAheadField<Prediction>(
                  hideOnLoading: true,
                  suggestionsCallback: (filter) async {
                    String ruta = "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter";
                    Uri url = Uri.parse(ruta);
                    var response = await http.get(url);
                    print(response.body);
                    var models = addressFromJson(response.body);
                    return models.predictions;
                  },
                  onSuggestionSelected: (Prediction data) {
                    print('id: ${data.placeId}');
                    setState(() {
                      listaDesparasita.add(data.name);
                    });
                    desparasitaController.clear();
                  },
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: desparasitaController,
                    decoration: InputDecoration(labelText: 'Busque desparasitación'),
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
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var item in listaDesparasita) 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width-16)*(7/8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item, style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width-16)*(1/8),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  listaDesparasita.remove(item);
                                });
                              },
                              child: Icon(Icons.delete_rounded),
                            ),
                          )
                        ],
                      ),
                  ],
                ),
                // SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recomendaciones', style: TextStyle(fontWeight: FontWeight.bold),),
                    IconButton(icon: Icon(
                      ! recomendaciones 
                      ? Icons.add_circle_rounded
                      : Icons.remove_circle_rounded), onPressed: (){
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
            padding: EdgeInsets.only(top: 10, left: 10, right: 10,  bottom: 5),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Monto desparasitación',
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.maxFinite,
                  child: btnPrimary(text: 'Guardar', onPressed: (){})
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}