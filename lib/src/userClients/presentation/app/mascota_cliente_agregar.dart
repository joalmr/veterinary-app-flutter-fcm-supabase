import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';

class MascotaClienteAgregar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar mascota'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Tipo mascota',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Raza',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Nombre',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Fecha de nacimiento',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Sexo',
            ),
          ),
          const SizedBox(height: 15),
          btnPrimary(
            text: 'Crear mascota',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
