class DataCondicion {
  String? id;
  String? name;
  DataCondicion({
    this.id,
    this.name,
  });
}

List<DataCondicion> condicionLista = [
  DataCondicion(id: '', name: 'Seleccione condición corporal..'),
  DataCondicion(id: '1', name: 'Muy delgado'),
  DataCondicion(id: '2', name: 'Bajo peso'),
  DataCondicion(id: '3', name: 'Ideal'),
  DataCondicion(id: '4', name: 'Sobrepeso'),
  DataCondicion(id: '5', name: 'Obeso'),
];
