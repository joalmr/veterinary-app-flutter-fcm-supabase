import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';

import 'clientView.dart';
import 'creaCliente.dart';

class UserClientsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Clientes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreaCliente());
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Icon(
                  Icons.accessibility_new_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            title: Text('Nombre Apellido $index'),
            onTap: () {
              Get.to(ClienteVista());
            },
          );
        },
      ),
    );
  }
}
