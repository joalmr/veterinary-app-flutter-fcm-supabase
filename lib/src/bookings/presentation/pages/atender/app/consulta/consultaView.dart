import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/bookings/data/model/diagnosesModel.dart';
import 'radioConsulta.dart';

class ConsultaView extends StatefulWidget {
  @override
  _ConsultaViewState createState() => _ConsultaViewState();
}

class _ConsultaViewState extends State<ConsultaView> {
  bool anamnesis = false;
  bool recomendaciones = false;
  
  final diagnosticoController = TextEditingController();
  var listaDiagnostico = <DiagnosesModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta'),),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8),
              children: [
                TypeAheadField<DiagnosesModel>(
                  // hideOnLoading: true,
                  suggestionsCallback: (filter) async {
                    final url = Uri.https(
                      urlBase,
                      '/autocomplete/diagnoses',
                      {"q": filter},
                    );
                    var response = await http.get(url);
                    var models = diagnosesModelFromJson(response.body);
                    return filter.trim()==''
                      ? []
                      : models;
                  },
                  onSuggestionSelected: (DiagnosesModel data) {
                    var doble = false;
                    listaDiagnostico.forEach((element) {
                      if(element.id==data.id)
                        doble=true;
                    });
                    if(!doble){
                      setState(() {
                        print(jsonEncode(data));
                        listaDiagnostico.add(data);
                      });
                      diagnosticoController.clear();
                    }
                  },
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: diagnosticoController,
                    decoration: InputDecoration(labelText: 'Busque diagnósticos'),
                  ),
                  noItemsFoundBuilder: (context)=>Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('No se encontró'),
                  ),
                  itemBuilder: (context, dato) => Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      dato.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var item in listaDiagnostico) 
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
                                Text(item.name, style: TextStyle(fontWeight: FontWeight.bold),),
                                RadioConsulta(selectValue: item.diagnoses,),
                              ],
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width-16)*(1/8),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  listaDiagnostico.remove(item);
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
                    Text('Anamnesis', style: TextStyle(fontWeight: FontWeight.bold),),
                    IconButton(icon: Icon(
                      ! anamnesis 
                      ? Icons.add_circle_rounded
                      : Icons.remove_circle_rounded
                    ), onPressed: (){
                      setState(() {
                        anamnesis = !anamnesis;
                      });
                    }),
                  ],
                ),
                anamnesis 
                ? TextFormField(
                  maxLines: 5,
                )
                : SizedBox(height: 0),
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
                    labelText: 'Monto consulta',
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