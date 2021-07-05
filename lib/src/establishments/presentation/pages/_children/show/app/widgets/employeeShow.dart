import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

Widget employee({int? type, String? name, String? code}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5, left: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          type == 1 ? 'Groomer' : 'Veterinario/a',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationColor: type == 1 ? colorBlue : colorGreen,
            decorationThickness: 2,
          ),
        ),
        Text(name ?? ''),
        if (code != null) Text(code) else const SizedBox(height: 0),
      ],
    ),
  );
}
