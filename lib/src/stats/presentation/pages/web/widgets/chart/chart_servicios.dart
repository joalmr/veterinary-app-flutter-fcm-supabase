import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/stats/data/model/stats_service_model.dart';
import 'package:vet_app/src/stats/domain/stats_controller.dart';
import '../../../../widgets/design_graph.dart';

class ChartServicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<StatsController>(
      builder: (_) {
        return Container(
          child: chartDesign(
            title: 'Servicios atendidos',
            widget: generalChart(_.services),
          ),
        );
      },
    );
  }
}

List<Color> colores = [
  Colors.red[300]!,
  Colors.blue[300]!,
  Colors.green[300]!,
  Colors.brown[300]!,
  Colors.purple[300]!,
  Colors.pink[300]!,
  Colors.cyan[300]!,
];

Widget generalChart(List<Services> listService) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              _chartBar(listService),
              Container(
                height: 5,
                width: 250,
                color: Colors.red,
              ),
            ],
          ),
        ),
        SizedBox(width: 5),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < listService.length; i++)
              ChartLegend(
                listService[i].name!,
                colores[i],
              ),
          ],
        ),
      ],
    ),
  );
}

Widget _chartBar(List<Services> listService) {
  double numeromayor = 0;
  for (int i = 0; i < listService.length && i < listService.length; i++) {
    if (listService[i].value! > numeromayor) {
      numeromayor = numeromayor + listService[i].value!;
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      for (var i = 0; i < listService.length; i++)
        _barDay(
          listService[i].name!,
          listService[i].value!.toDouble(),
          colores[i],
          numeromayor,
        )
    ],
  );
}

Widget _barDay(String day, double value, Color color, double mayor) {
  final double valorY = (value * 150) / mayor;

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 2.5),
    height: 150,
    width: 30.0,
    decoration: BoxDecoration(
      color: Color(0xffF6F6FC),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
    ),
    alignment: Alignment.bottomCenter,
    child: Container(
      height: valorY,
      width: 25.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            value.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ),
    ),
  );
}

class ChartLegend extends StatelessWidget {
  final String type;
  final Color color;
  ChartLegend(this.type, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5),
            color: color,
          ),
        ),
        SizedBox(width: 5),
        Text(type)
      ],
    );
  }
}
