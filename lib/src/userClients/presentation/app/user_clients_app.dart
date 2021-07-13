import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';

import 'client_view.dart';
import 'crea_cliente.dart';

class UserClientsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MediaQuery.of(context).size.width > 900 ? null : MenuDrawer(),
      appBar: MediaQuery.of(context).size.width > 900
          ? null
          : AppBar(
              title: Text('Clientes'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreaCliente());
        },
        child: Icon(Icons.add_rounded),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetPlatform.isWeb
              ? Container(
                  margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
                  child: Text(
                    'Clientes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                )
              : SizedBox(height: 0),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
