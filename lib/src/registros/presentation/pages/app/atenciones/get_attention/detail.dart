import 'package:flutter/material.dart';
import 'package:vet_app/resources/icons/proypet_icons.dart';

Widget detailAttention(jsonType) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      jsonType.containsKey('surgery')
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            IconProypet.cirugia,
                            size: 18,
                          ),
                        ),
                        Text(
                          'Cirugía',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                      'Recomendación: ${jsonType['surgery']['recommendations'] ?? '-'}'),
                  Text('Monto: ${jsonType['surgery']['amount']}'),
                ],
              ),
            )
          : SizedBox(height: 0),
      jsonType.containsKey('consultation')
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            IconProypet.consulta,
                            size: 18,
                          ),
                        ),
                        Text(
                          'Consulta',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                      'Anamnesis: ${jsonType['consultation']['anamnesis'] ?? '-'}'),
                  Text(
                      'Recomendación: ${jsonType['consultation']['recommendations'] ?? '-'}'),
                  Text('Diagnósticos:'),
                  for (var diagnoses in jsonType['consultation']['diagnoses'])
                    Text('- ${diagnoses['name']}'),
                  Text('Monto: ${jsonType['consultation']['amount']}'),
                ],
              ),
            )
          : SizedBox(height: 0),
      jsonType.containsKey('deworming')
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            IconProypet.desparasitacion,
                            size: 18,
                          ),
                        ),
                        Text(
                          'Desparasitación',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                      'Recomendación: ${jsonType['deworming']['recommendations'] ?? '-'}'),
                  Text('Desparasitantes:'),
                  for (var dewormers in jsonType['deworming']['dewormers'])
                    Text('- ${dewormers['name']}'),
                  Text('Monto: ${jsonType['deworming']['amount']}'),
                ],
              ),
            )
          : SizedBox(height: 0),
      jsonType.containsKey('grooming')
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            IconProypet.grooming,
                            size: 18,
                          ),
                        ),
                        Text(
                          'Grooming',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                      'Recomendación: ${jsonType['grooming']['recommendations'] ?? '-'}'),
                  Text('Groomings:'),
                  for (var grooming in jsonType['grooming']['groomings'])
                    Text('- $grooming'),
                  Text('Monto: ${jsonType['grooming']['amount']}'),
                ],
              ),
            )
          : SizedBox(height: 0),
      jsonType.containsKey('vaccination')
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            IconProypet.vacuna,
                            size: 18,
                          ),
                        ),
                        Text(
                          'Vacuna',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                      'Recomendación: ${jsonType['vaccination']['recommendations'] ?? '-'}'),
                  Text('Vacunas:'),
                  for (var vaccines in jsonType['vaccination']['vaccines'])
                    Text('- ${vaccines['name']}'),
                  Text('Monto: ${jsonType['vaccination']['amount']}'),
                ],
              ),
            )
          : SizedBox(height: 0),
      jsonType.containsKey('testing')
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            IconProypet.tuboEnsayo,
                            size: 18,
                          ),
                        ),
                        Text(
                          'Examen',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                      'Recomendación: ${jsonType['testing']['recommendations'] ?? '-'}'),
                  Text('Exámenes:'),
                  for (var tests in jsonType['testing']['tests'])
                    Text('- ${tests['name']}'),
                  Text('Monto: ${jsonType['testing']['amount']}'),
                ],
              ),
            )
          : SizedBox(height: 0),
      jsonType.containsKey('other')
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            IconProypet.farmacia,
                            size: 18,
                          ),
                        ),
                        Text(
                          'Otro',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                      'Recomendación: ${jsonType['other']['recommendations'] ?? '-'}'),
                  Text('Otros:'),
                  for (var others in jsonType['other']['others'])
                    Text('- ${others['name']}'),
                  Text('Monto: ${jsonType['other']['amount']}'),
                ],
              ),
            )
          : SizedBox(height: 0)
    ],
  );
}
