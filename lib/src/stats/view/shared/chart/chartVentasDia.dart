import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/view/dataTemp/dataVentasDia.dart';

import '../designGraph.dart';

class ChartVentasDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return chartDesign(
      title: 'Ventas por día',
      widget: Container(
        padding: EdgeInsets.all(10),
        child: _chartBar(dataVentasDia),
      ),
    );
  }
}

Widget _chartBar(List<DataDay> listDay) {
  double numeromayor = 0;
  for (int i = 0; i < listDay.length && i < listDay.length; i++) {
    if (listDay[i].value > numeromayor) {
      numeromayor = listDay[i].value;
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: listDay
        .map(
          (e) => _barDay(
            e.name,
            e.value,
            numeromayor,
          ),
        )
        .toList(),
  );
}

Widget _barDay(String day, double value, double mayor) {
  double valorY = (value * 150) / mayor;
  // double ancho = (400 - (10 * 2)) / 7;

  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 2.5),
        height: 150,
        width: 40.0,
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
          width: 35.0,
          decoration: BoxDecoration(
            color: colorGreen,
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
      ),
      // Container(
      //   height: 5,
      //   width: ancho,
      //   color: Colors.red,
      // ),
      SizedBox(height: 5),
      Text(
        day.substring(0, 3),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    ],
  );
}
