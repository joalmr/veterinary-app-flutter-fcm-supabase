import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/view/dataTemp/dataUsuario.dart';

import '../designGraph.dart';
import '../wValuePercent.dart';

class PercentUsuariosMensual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: chartDesign(
        title: 'Usuarios Mensual',
        colorFondo: Colors.transparent,
        widget: Container(
          padding: EdgeInsets.all(5.0),
          child: _percent(dataUsuario),
        ),
      ),
    );
  }
}

Widget _percent(List<DataUsuario> listData) {
  double valueTotal = 0;

  for (int i = 0; i < listData.length && i < listData.length; i++) {
    valueTotal = valueTotal + listData[i].value;
  }

  return Column(
    children: listData
        .map(
          (e) => wValuePercent(
            color: colorGreen.withAlpha(60),
            colorData: colorGreen,
            count: e.value.toStringAsFixed(0),
            name: e.name,
            progress: double.parse((e.value / valueTotal).toStringAsFixed(2)),
          ),
        )
        .toList(),
  );
}
