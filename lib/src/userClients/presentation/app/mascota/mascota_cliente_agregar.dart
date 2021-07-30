import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';

class MascotaClienteAgregar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar mascota'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Tipo mascota',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Raza',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Nombre',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Fecha de nacimiento',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Sexo',
            ),
          ),
          SizedBox(height: 15),
          btnPrimary(
            text: 'Crear mascota',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
