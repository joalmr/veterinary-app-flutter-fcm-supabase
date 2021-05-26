import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vet_app/src/establishments/data/model/prediction.dart';

class GroomingView extends StatefulWidget {
  @override
  _GroomingViewState createState() => _GroomingViewState();
}

class _GroomingViewState extends State<GroomingView> {
  bool recomendaciones = false;
  
  final groomingController = TextEditingController();
  var listaGrooming = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grooming'),),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8),
              children: [

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10,  bottom: 5),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Monto grooming',
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