import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/presentation/widgets/dataTemp/dataVentaMensual.dart';
import 'package:vet_app/src/stats/presentation/widgets/designGraph.dart';

import '../wValuePercent.dart';

class PercentVentaMensual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: chartDesign(
        title: 'Venta Mensual',
        colorFondo: Colors.transparent,
        widget: Container(
          padding: EdgeInsets.all(5.0),
          child: _percent(dataVentaMensual),
        ),
      ),
    );
  }
}

Widget _percent(List<DataVentaMensual> listData) {
  double valueTotal = 0;

  for (int i = 0; i < listData.length && i < listData.length; i++) {
    valueTotal = valueTotal + listData[i].value;
  }

  return Column(
    children: listData
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
