import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/stats/domain/statsController.dart';
import 'package:vet_app/src/stats/presentation/pages/app/components/statCard.dart';

class ValuesStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<StatsController>(
      builder: (_) {
        if (_.cargaBase.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                      '''${formatDate(_.initialIn!)} a ${formatDate(_.initialOut!)}'''),
                ),
                StatCard(
                  icon: Icons.star_rounded,
                  text: 'Estrellas',
                  value: _.statBase.value.stars!,
                  color: colorGreen,
                ),
                StatCard(
                  icon: Icons.emoji_people_rounded,
                  text: 'Votantes',
                  value: _.statBase.value.votes.toString(),
                  color: colorGreen,
                ),
                StatCard(
                  icon: Icons.pets_rounded,
                  text: 'Perros',
                  value: _.statBase.value.dogs.toString(),
                  color: colorGreen,
                ),
                StatCard(
                  icon: Icons.pets_rounded,
                  text: 'Gatos',
                  value: _.statBase.value.cats.toString(),
                  color: colorGreen,
                ),
                StatCard(
                  icon: Icons.desktop_access_disabled_rounded,
                  text: 'No atendidas',
                  value: _.statBase.value.nonAttendedPercentage.toString(),
                  color: colorRed,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
