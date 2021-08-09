String? validateTime(String texto) {
  if (texto.isEmpty) return 'Ingrese hora';
  if (texto.length < 5) return 'Complete hora';

  final timeWrite = texto.split(':');
  final int hour = int.parse(timeWrite[0]);
  final int minute = int.parse(timeWrite[1]);

  if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
    return 'Formato de hora invalido';
  }

  return null;
}
