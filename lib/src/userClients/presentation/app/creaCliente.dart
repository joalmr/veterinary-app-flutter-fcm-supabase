import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';

class CreaCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear cliente'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nombre del cliente',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Apellido del cliente',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email del cliente',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Telf. del cliente',
            ),
          ),
          SizedBox(height: 15),
          btnPrimary(
            text: 'Crear cliente',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
