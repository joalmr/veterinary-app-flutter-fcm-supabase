import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/data/model/stats_sales_monthly_model.dart';
import 'package:vet_app/src/stats/domain/stats_controller.dart';
import 'package:vet_app/src/stats/presentation/widgets/design_graph.dart';

import '../w_value_percent.dart';

class PercentVentaMensual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<StatsController>(
      builder: (_) {
        return SingleChildScrollView(
          child: chartDesign(
            title: 'Venta Mensual',
            colorFondo: Colors.transparent,
            widget: _.cargaSalesMonth.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Últimos 3 meses'),
                        ),
                        _percent(_.salesMonth),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

Widget _percent(List<SalesMonth> listData) {
  double valueTotal = 0;

  for (int i = 0; i < listData.length && i < listData.length; i++) {
    valueTotal = valueTotal + listData[i].value!;
  }

  return Column(
    children: listData
        .map(
          (e) => wValuePercent(
            color: Colors.grey[200], //colorGreen.withAlpha(50),
            colorData: colorGreen,
            count: 'S/ ${e.value!.toStringAsFixed(2)}',
            name: e.name!,
            progress: double.parse((e.value! / valueTotal).toStringAsFixed(2)),
          ),
        )
        .toList(),
  );
}
