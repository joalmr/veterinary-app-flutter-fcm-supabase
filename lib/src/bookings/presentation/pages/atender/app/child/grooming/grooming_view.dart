import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text('Eliminar'),
                  content:
                      const Text('Seguro que desea eliminar esta atención?'),
                  actions: <Widget>[
                    btnAltern(
                      text: 'Cancelar',
                      onPressed: () => Get.back(),
                    ),
                    btnAltern(
                      text: 'Eliminar',
                      onPressed: () {},
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: btnPrimary(
                      text: 'Guardar',
                      onPressed: () {},
                    ),
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
