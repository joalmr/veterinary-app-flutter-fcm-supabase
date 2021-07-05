import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';

import 'clientView.dart';
import 'creaCliente.dart';

class UserClientsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_rounded),
        onPressed: () {
          Get.to(CreaCliente());
        },
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Icon(
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
