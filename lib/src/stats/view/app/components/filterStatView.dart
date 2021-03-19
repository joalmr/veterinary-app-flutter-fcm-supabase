import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/forms/dateForm.dart';

class FilterStatView extends StatelessWidget {
  const FilterStatView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flitro de estadísticas'),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          Text(
            'Fecha desde',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 5),
          dateForm(),
          SizedBox(width: 10),
          Text(
            'Fecha hasta',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 5),
          dateForm(),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: btnPrimary(
              text: 'Buscar',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
