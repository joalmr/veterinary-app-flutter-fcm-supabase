import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/forms/dateForm.dart';
import 'package:vet_app/components/forms/timeForm.dart';

class NewEventDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agregar evento',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Título'),
            textCapitalization: TextCapitalization.sentences,
          ),
          SizedBox(height: 15),
          Text('Fecha'),
          dateForm(),
          SizedBox(height: 5),
          Text('Hora'),
          timeForm(),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(labelText: 'Integrantes'),
            textCapitalization: TextCapitalization.words,
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(labelText: 'Descripción'),
            textCapitalization: TextCapitalization.sentences,
            maxLength: 150,
            maxLines: 5,
          ),
          SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: btnPrimary(
              text: 'Agregar',
              onPressed: () {},
            ),
          ),
          SizedBox(height: 20),
        ],
      )
    );
  }
}