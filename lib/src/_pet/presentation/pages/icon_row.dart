import 'package:flutter/material.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/icons/proypet_icons.dart';

Widget iconRow(jsonData) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      jsonData.containsKey('surgery')
          ? Padding(
              padding: const EdgeInsets.only(right: 2.5),
              child: Icon(
                IconProypet.cirugia,
                size: 18,
              ),
            )
          : SizedBox(height: 0),
      jsonData.containsKey('consultation')
          ? Padding(
              padding: const EdgeInsets.only(right: 2.5),
              child: Icon(
                IconProypet.consulta,
                size: 18,
              ),
            )
          : SizedBox(height: 0),
      jsonData.containsKey('deworming')
          ? Padding(
              padding: const EdgeInsets.only(right: 2.5),
              child: Icon(
                IconProypet.desparasitacion,
                size: 18,
              ),
            )
          : SizedBox(height: 0),
      jsonData.containsKey('grooming')
          ? Padding(
              padding: const EdgeInsets.only(right: 2.5),
              child: Icon(
                IconProypet.grooming,
                size: 18,
              ),
            )
          : SizedBox(height: 0),
      jsonData.containsKey('vaccination')
          ? Padding(
              padding: const EdgeInsets.only(right: 2.5),
              child: Icon(
                IconProypet.vacuna,
                size: 18,
              ),
            )
          : SizedBox(height: 0),
      jsonData.containsKey('testing')
          ? Padding(
              padding: const EdgeInsets.only(right: 2.5),
              child: Icon(
                IconProypet.tuboEnsayo,
                size: 18,
              ),
            )
          : SizedBox(height: 0),
      jsonData.containsKey('other')
          ? Padding(
              padding: const EdgeInsets.only(right: 2.5),
              child: Icon(
                IconProypet.farmacia,
                size: 18,
              ),
            )
          : SizedBox(height: 0)
    ],
  );
}

Widget detailRow(jsonType, establishmentId) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      jsonType.containsKey('surgery')
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Text(
                    'Cirugía',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                    'Recomendación: ${jsonType['surgery']['recommendations'] ?? '-'}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonType['surgery']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonType.containsKey('consultation')
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Text(
                    'Consulta',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text(
                        'Anamnesis: ${jsonType['consultation']['anamnesis'] ?? '-'}'),
                Text(
                    'Recomendación: ${jsonType['consultation']['recommendations'] ?? '-'}'),
                Text('Diagnósticos:'),
                for (var diagnoses in jsonType['consultation']['diagnoses'])
                  Text('- ${diagnoses['name']}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonType['consultation']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonType.containsKey('deworming')
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Text(
                    'Desparasitación',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                    'Recomendación: ${jsonType['deworming']['recommendations'] ?? '-'}'),
                Text('Desparasitantes:'),
                for (var dewormers in jsonType['deworming']['dewormers'])
                  Text('- ${dewormers['name']}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonType['deworming']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonType.containsKey('grooming')
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Text(
                    'Grooming',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                    'Recomendación: ${jsonType['grooming']['recommendations'] ?? '-'}'),
                Text('Groomings:'),
                for (var grooming in jsonType['grooming']['groomings'])
                  Text('- $grooming'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonType['grooming']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonType.containsKey('vaccination')
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Text(
                    'Vacuna',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                    'Recomendación: ${jsonType['vaccination']['recommendations'] ?? '-'}'),
                Text('Vacunas:'),
                for (var vaccines in jsonType['vaccination']['vaccines'])
                  Text('- ${vaccines['name']}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonType['vaccination']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonType.containsKey('testing')
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Text(
                    'Examen',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                    'Recomendación: ${jsonType['testing']['recommendations'] ?? '-'}'),
                Text('Exámenes:'),
                for (var tests in jsonType['testing']['tests'])
                  Text('- ${tests['name']}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonType['testing']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonType.containsKey('other')
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Text(
                    'Otro',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                    'Recomendación: ${jsonType['other']['recommendations'] ?? '-'}'),
                Text('Otros:'),
                for (var others in jsonType['other']['others'])
                  Text('- ${others['name']}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonType['other']['amount']}'),
              ],
            )
          : SizedBox(height: 0)
    ],
  );
}
