import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/__global/presentation/colorGenerate.dart';
import 'package:vet_app/src/stats/data/model/statsServiceModel.dart';
import 'package:vet_app/src/stats/domain/statsController.dart';
import 'package:vet_app/src/stats/presentation/widgets/designGraph.dart';

import '../pruebaData.dart';
import '../wValuePercent.dart';

class PercentServicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<StatsController>(
      builder: (_) {
        return _.cargaServices.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: chartDesign(
                title: 'Servicios atendidos',
                colorFondo: Colors.transparent,
                widget: Container(
                  padding: EdgeInsets.all(5.0),
                  child: _percent(_.services, _.paiChartList, context),
                ),
              ),
            );
      },
    );
    
  }
}

Widget _percent(List<Services> listService, List<PieChartSectionData> paiChart, BuildContext context) {
  double valueTotal = 0;
  
  for (int i = 0; i < listService.length && i < listService.length; i++) {
    valueTotal = valueTotal + listService[i].value;
  }
  
  return SingleChildScrollView(
      child: Column(
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 70,
                  startDegreeOffset: -90,
                  sections: paiChart,
                ),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      valueTotal.toStringAsFixed(0),
                      style: Theme.of(context).textTheme.headline4.copyWith(
                        // color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                    ),
                    Text("servicios"),
                  ],
                ),
              ),
            ],
          ),
        ),
        for (var i = 0; i < listService.length; i++) 
          wValuePercent(
            color: Colors.grey[200], //colorGreen.withAlpha(50)
            colorData: paiChart[i].color,
            count: listService[i].value.toStringAsFixed(0),
            name: listService[i].name,
            progress: double.parse((listService[i].value / valueTotal).toStringAsFixed(2)),
          )
      ],
    ),
  );
  
  // SingleChildScrollView(
  //     child: Column(
  //     children: [
        
  //       for (var e in listService)
  //         wValuePercent(
  //           color: Colors.grey[200], //colorGreen.withAlpha(50)
  //           colorData: colorGreen,
  //           count: e.value.toStringAsFixed(0),
  //           name: e.name,
  //           progress: double.parse((e.value / valueTotal).toStringAsFixed(2)),
  //         )
        
  //     ],
  //   ),
  // );
}
