import 'package:flutter/material.dart';
import 'package:vet_app/src/stats/presentation/widgets/dataTemp/dataService.dart';

import '../../../../widgets/designGraph.dart';

class ChartServicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      // width: Get.context.width,
      // margin: EdgeInsets.all(10.0),
      child: chartDesign(
        title: 'Servicios atendidos',
        widget: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    _chartBar(dataServices),
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
                children: dataServices
                    .map(
                      (e) => ChartLegend(
                        e.name,
                        e.color,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _chartBar(List<DataService> listService) {
  double numeromayor = 0;
  for (int i = 0; i < listService.length && i < listService.length; i++) {
    if (listService[i].value > numeromayor) {
      numeromayor = listService[i].value;
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: listService
        .map(
          (e) => _barDay(
            e.name,
            e.value,
            e.color,
            numeromayor,
          ),
        )
        .toList(),
  );
}

Widget _barDay(String day, double value, Color color, double mayor) {
  double valorY = (value * 150) / mayor;

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
