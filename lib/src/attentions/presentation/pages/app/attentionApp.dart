import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';

import 'atenciones/atencionesView.dart';
import 'filtros/filtrosView.dart';

class AttentionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text('Registros'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_rounded),
            onPressed: () => Get.to(FiltroAtenciones()),
          ),
        ],
      ),
      body: AtencionesView(),
    );
  }
}
