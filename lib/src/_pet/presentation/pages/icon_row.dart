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

Widget detailRow(jsonData, establishmentId) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      jsonData.containsKey('surgery')
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
                    'Recomendación: ${jsonData['surgery']['recommendations'] ?? '-'}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonData['surgery']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonData.containsKey('consultation')
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
                        'Anamnesis: ${jsonData['consultation']['anamnesis'] ?? '-'}'),
                Text(
                    'Recomendación: ${jsonData['consultation']['recommendations'] ?? '-'}'),
                Text('Diagnósticos:'),
                for (var diagnoses in jsonData['consultation']['diagnoses'])
                  Text('- ${diagnoses['name']}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonData['consultation']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonData.containsKey('deworming')
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
                    'Recomendación: ${jsonData['deworming']['recommendations'] ?? '-'}'),
                Text('Desparasitantes:'),
                for (var dewormers in jsonData['deworming']['dewormers'])
                  Text('- ${dewormers['name']}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonData['deworming']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonData.containsKey('grooming')
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
                    'Recomendación: ${jsonData['grooming']['recommendations'] ?? '-'}'),
                Text('Groomings:'),
                for (var grooming in jsonData['grooming']['groomings'])
                  Text('- $grooming'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonData['grooming']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonData.containsKey('vaccination')
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
                    'Recomendación: ${jsonData['vaccination']['recommendations'] ?? '-'}'),
                Text('Vacunas:'),
                for (var vaccines in jsonData['vaccination']['vaccines'])
                  Text('- ${vaccines['name']}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonData['vaccination']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonData.containsKey('testing')
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
                    'Recomendación: ${jsonData['testing']['recommendations'] ?? '-'}'),
                Text('Exámenes:'),
                for (var tests in jsonData['testing']['tests'])
                  Text('- ${tests['name']}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonData['testing']['amount']}'),
              ],
            )
          : SizedBox(height: 0),
      jsonData.containsKey('other')
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
                    'Recomendación: ${jsonData['other']['recommendations'] ?? '-'}'),
                Text('Otros:'),
                for (var others in jsonData['other']['others'])
                  Text('- ${others['name']}'),
                establishmentId != prefUser.vetId
                    ? SizedBox(height: 0)
                    : Text('Monto: ${jsonData['other']['amount']}'),
              ],
            )
          : SizedBox(height: 0)
    ],
  );
}
