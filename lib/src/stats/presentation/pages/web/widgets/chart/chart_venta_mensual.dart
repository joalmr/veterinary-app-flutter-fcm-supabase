import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/presentation/widgets/dataTemp/data_venta_mensual.dart';

import '../../../../widgets/design_graph.dart';

class ChartVentaMensual extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChartVentaMensualState();
}

class ChartVentaMensualState extends State<ChartVentaMensual> {
  @override
  Widget build(BuildContext context) {
    return chartDesign(
      title: 'Venta Mensual',
      widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: _chartBar(dataVentaMensual),
      ),
    );
  }

  Widget _chartBar(List<DataVentaMensual> listData) {
    double numeromayor = 0;
    for (int i = 0; i < listData.length && i < listData.length; i++) {
      if (listData[i].value! > numeromayor) {
        numeromayor = listData[i].value!;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: listData
          .map(
            (e) => _barVenta(
              e.name!,
              e.value!,
              numeromayor,
            ),
          )
          .toList(),
    );
  }

  Widget _barVenta(String day, double value, double mayor) {
    final double valorY = (value * 150) / mayor;
    // double ancho = (400 - (40 * 2)) / 3;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2.5),
          height: 150,
          width: 60.0,
          decoration: const BoxDecoration(
            color: Color(0xffF6F6FC),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            height: valorY,
            width: 55.0,
            decoration: const BoxDecoration(
              color: colorGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  value.toString(),
                  style: const TextStyle(
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
        const SizedBox(height: 5),
        Text(
          day.substring(0, 3),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
// LineChartData sampleData1() {
//   var valor = [299.0, 725.0, 450];
//   double numeromayor = 0.0;
//   for (int i = 0; i < valor.length && i < valor.length; i++) {
//     if (valor[i] > numeromayor) {
//       numeromayor = valor[i];
//     }
//   }
//   double datoValor = (numeromayor / 3) / 1000;

//   final LineChartBarData lineChartBarData1 = LineChartBarData(
//     spots: [
//       FlSpot(
//           0, double.parse((valor[0] / numeromayor).toStringAsFixed(1)) * 5),
//       FlSpot(
//           1, double.parse((valor[1] / numeromayor).toStringAsFixed(1)) * 5),
//       FlSpot(
//           2, double.parse((valor[2] / numeromayor).toStringAsFixed(1)) * 5),
//     ],
//     isCurved: false,
//     colors: [colorGreen],
//     barWidth: 8,
//     dotData: FlDotData(show: true),
//     belowBarData: BarAreaData(show: false),
//   );

//   List<LineChartBarData> lineList = [lineChartBarData1];

//   return LineChartData(
//     lineTouchData: LineTouchData(
//       touchTooltipData: LineTouchTooltipData(
//         tooltipBgColor: Colors.white,
//       ),
//       handleBuiltInTouches: false,
//     ),
//     gridData: FlGridData(show: true),
//     titlesData: FlTitlesData(
//       bottomTitles: SideTitles(
//         showTitles: true,
//         reservedSize: 22,
//         getTextStyles: (value) => TextStyle(
//           color: Color(0xff72719b),
//           fontWeight: FontWeight.bold,
//           fontSize: 16,
//         ),
//         margin: 10,
//         getTitles: (value) {
//           switch (value.toInt()) {
//             case 0:
//               return 'ENE';
//             case 1:
//               return 'FEB';
//             case 2:
//               return 'MAR';
//           }
//           return '';
//         },
//       ),
//       leftTitles: SideTitles(
//         showTitles: true,
//         getTextStyles: (value) => TextStyle(
//           color: Color(0xff75729e),
//           fontWeight: FontWeight.bold,
//         ),
//         getTitles: (value) {
//           switch (value.toInt()) {
//             case 1:
//               return '${datoValor.toStringAsFixed(1)}k';
//             case 3:
//               return '${(datoValor * 2).toStringAsFixed(1)}k';
//             case 5:
//               return '${(datoValor * 3).toStringAsFixed(1)}k';
//           }
//           return '';
//         },
//         margin: 8,
//         reservedSize: 30,
//       ),
//     ),
//     borderData: FlBorderData(
//       show: true,
//       border: Border(
//         bottom: BorderSide(
//           color: Colors.blue[300],
//           width: 4,
//         ),
//         left: BorderSide(color: Colors.transparent),
//         right: BorderSide(color: Colors.transparent),
//         top: BorderSide(color: Colors.transparent),
//       ),
//     ),
//     minX: 0,
//     maxX: 2,
//     maxY: 5,
//     minY: 0,
//     lineBarsData: lineList,
//   );
// }
