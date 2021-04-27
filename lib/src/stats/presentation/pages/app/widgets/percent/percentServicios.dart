import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/data/model/statsServiceModel.dart';
import 'package:vet_app/src/stats/domain/statsController.dart';
import 'package:vet_app/src/stats/presentation/widgets/designGraph.dart';

import '../wValuePercent.dart';

class PercentServicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<StatsController>(
      builder: (_) {
        return SingleChildScrollView(
          child: chartDesign(
            title: 'Servicios atendidos',
            colorFondo: Colors.transparent,
            widget: 
            _.cargaServices.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            :
            Container(
              padding: EdgeInsets.all(5.0),
              child: _percent(_.services),
            ),
          ),
        );
      },
    );
    
  }
}

Widget _percent(List<Services> listService) {
  double valueTotal = 0;
  for (int i = 0; i < listService.length && i < listService.length; i++) {
    valueTotal = valueTotal + listService[i].value;
  }

  return Column(
    children: listService
        .map(
          (e) => wValuePercent(
            color: Colors.grey[200], //colorGreen.withAlpha(50)
            colorData: colorGreen,
            count: e.value.toStringAsFixed(0),
            name: e.name,
            progress: double.parse((e.value / valueTotal).toStringAsFixed(2)),
          ),
        )
        .toList(),
  );
}
