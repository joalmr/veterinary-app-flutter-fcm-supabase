import 'package:flutter/material.dart';

import 'package:vet_app/src/stats/view/shared/percent/percentServicios.dart';
import 'package:vet_app/src/stats/view/shared/percent/percentUsuariosMensual.dart';
import 'package:vet_app/src/stats/view/shared/percent/percentVentaMensual.dart';
import 'package:vet_app/src/stats/view/shared/percent/percentVentasDia.dart';

class GraphStats extends StatelessWidget {
  const GraphStats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PercentServicios(),
          PercentVentasDia(),
          PercentVentaMensual(),
          PercentUsuariosMensual(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
