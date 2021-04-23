import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/presentation/widgets/dataTemp/dataService.dart';

import '../designGraph.dart';
import '../wValuePercent.dart';

class PercentServicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: chartDesign(
        title: 'Servicios atendidos',
        colorFondo: Colors.transparent,
        widget: Container(
          padding: EdgeInsets.all(5.0),
          child: _percent(dataServices),
        ),
      ),
    );
  }
}

Widget _percent(List<DataService> listService) {
  double valueTotal = 0;
  for (int i = 0; i < listService.length && i < listService.length; i++) {
    valueTotal = valueTotal + listService[i].value;
  }

  return Column(
    children: listService
        .map(
          (e) => wValuePercent(
            color: colorGreen.withAlpha(50), //colorGreen,
            colorData: colorGreen,
            count: e.value.toStringAsFixed(0),
            name: e.name,
            progress: double.parse((e.value / valueTotal).toStringAsFixed(2)),
          ),
        )
        .toList(),
  );
}
