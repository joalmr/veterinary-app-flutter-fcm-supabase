import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';

class CreaCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cliente'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nombre del cliente',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Apellido del cliente',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email del cliente',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Telf. del cliente',
            ),
          ),
          const SizedBox(height: 15),
          btnPrimary(
            text: 'Crear cliente',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
