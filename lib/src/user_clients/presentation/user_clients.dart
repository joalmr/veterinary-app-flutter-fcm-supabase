import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/src/user_clients/domain/user_clients_controller.dart';

import 'app/clientes/busca_cliente.dart';
import 'app/clientes/crea_cliente.dart';
import 'app/user_clients_app.dart';
// import 'package:get/get.dart';
// import 'app/user_clients_app.dart';
// import 'web/user_clients_web.dart';

class UserClientsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientsController>(
      builder: (_) {
        return MainLayout(
          drawerActive: true,
          title: 'Clientes',
          actions: [
            IconButton(
              onPressed: () {
                Get.to(BuscaCliente());
              },
              icon: Icon(Icons.search_rounded),
            ),
          ],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(CreaCliente());
            },
            child: Icon(Icons.add_rounded),
          ),
          body: UserClientsApp(),
        );
      },
    );
  }
}
