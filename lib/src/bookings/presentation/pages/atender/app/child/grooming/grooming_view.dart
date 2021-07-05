import 'package:flutter/material.dart';

import 'package:vet_app/components/buttons.dart';

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
      appBar: AppBar(
        title: const Text('Grooming'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Monto grooming',
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.maxFinite,
                  child: btnPrimary(
                    text: 'Guardar',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
