import 'package:flutter/material.dart';

class Step1 extends StatelessWidget {
  const Step1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          Text('Nombre'),
          TextFormField(),
          SizedBox(height: 5),
          Text('Teléfono'),
          TextFormField(),
          SizedBox(height: 5),
          Text('RUC'),
          TextFormField(),
          SizedBox(height: 5),
          Text('Web o red social'),
          TextFormField(),
          SizedBox(height: 5),
          Text('Tipo'),
          TextFormField(),
          SizedBox(height: 5),
          Text('Servicios'),
          Container(
            height: 40,
            color: Colors.pink,
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
