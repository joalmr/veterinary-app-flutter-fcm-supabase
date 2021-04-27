import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/presentation/widgets/dataTemp/dataVentasDia.dart';
import 'package:vet_app/src/stats/presentation/widgets/designGraph.dart';

import '../wValuePercent.dart';

class PercentVentasDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: chartDesign(
        title: 'Ventas por día',
        colorFondo: Colors.transparent,
        widget: Container(
          padding: EdgeInsets.all(5.0),
          child: _percent(dataVentasDia),
        ),
      ),
    );
  }
}

Widget _percent(List<DataDay> listDay) {
  double valueTotal = 0;

  for (int i = 0; i < listDay.length && i < listDay.length; i++) {
    valueTotal = valueTotal + listDay[i].value;
  }

  return Column(
    children: listDay
        .map(
          (e) => wValuePercent(
            color: colorGreen.withAlpha(50),
            colorData: colorGreen,
            count: 'S/ ${e.value.toStringAsFixed(2)}',
            name: e.name,
            progress: double.parse((e.value / valueTotal).toStringAsFixed(2)),
          ),
        )
        .toList(),
  );
}
