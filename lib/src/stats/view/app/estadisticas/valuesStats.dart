import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/view/app/components/statCard.dart';

class ValuesStats extends StatelessWidget {
  const ValuesStats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StatCard(
            icon: Icons.star_rounded,
            text: 'Estrellas',
            value: '4.8',
            color: colorGreen,
          ),
          StatCard(
            icon: Icons.emoji_people_rounded,
            text: 'Votantes',
            value: '10',
            color: colorGreen,
          ),
          StatCard(
            icon: Icons.pets_rounded,
            text: 'Perros',
            value: '50',
            color: colorGreen,
          ),
          StatCard(
            icon: Icons.pets_rounded,
            text: 'Gatos',
            value: '20',
            color: colorGreen,
          ),
          StatCard(
            icon: Icons.desktop_access_disabled_rounded,
            text: 'No atendidas',
            value: '10%',
            color: colorRed,
          ),
        ],
      ),
    );
  }
}
