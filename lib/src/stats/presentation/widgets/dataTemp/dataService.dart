import 'package:flutter/material.dart';

class DataService {
  String? name;
  double? value;
  Color? color;
  DataService({
    this.name,
    this.value,
    this.color,
  });
}

List<DataService> dataServices = [
  DataService(name: 'Consulta', value: 40.0, color: Colors.red[300]),
  DataService(name: 'Cirugía', value: 20.0, color: Colors.blue[300]),
  DataService(name: 'Grooming', value: 80.0, color: Colors.green[300]),
  DataService(name: 'Desparasitación', value: 60.0, color: Colors.brown[300]),
  DataService(name: 'Vacuna', value: 55.0, color: Colors.purple[300]),
  DataService(name: 'Examen', value: 35.0, color: Colors.pink[300]),
  DataService(name: 'Otros', value: 25.0, color: Colors.cyan[300]),
];
