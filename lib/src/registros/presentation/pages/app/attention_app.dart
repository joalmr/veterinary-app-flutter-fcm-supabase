import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';

import 'atenciones/atenciones_view.dart';
import 'filtros/filtros_view.dart';

class AttentionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Registros'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_rounded),
            onPressed: () => Get.to(FiltroAtenciones()),
          ),
        ],
      ),
      body: const AtencionesView(),
    );
  }
}
