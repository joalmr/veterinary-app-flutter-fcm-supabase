import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/domain/statsController.dart';
import 'package:vet_app/src/stats/presentation/pages/app/components/statCard.dart';

class ValuesStats extends StatelessWidget {
  const ValuesStats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<StatsController>(
      builder: (_) {
        return _.cargaBase.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    StatCard(
                      icon: Icons.star_rounded,
                      text: 'Estrellas',
                      value: _.statBase.value.stars,
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
      },
    );
  }
}
