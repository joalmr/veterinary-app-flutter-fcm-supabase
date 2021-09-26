import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/products/data/svg_venta.dart';
import 'package:vet_app/src/products/data/text_products.dart';
import 'package:vet_app/src/stats/domain/stats_controller.dart';

class VersusSales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatsController>(
      id: 'versusSales',
      builder: (_) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                  '''${formatDate(_.initialIn!)} a ${formatDate(_.initialOut!)}'''),
            ),
            containerVersus(
              posicion: 1,
              ingreso: _.generalVersus[0]['ingreso'],
              egreso: _.generalVersus[0]['egreso'],
            ),
            containerVersus(
              posicion: 2,
              ingreso: _.generalVersus[1]['ingreso'],
              egreso: _.generalVersus[1]['egreso'],
            ),
            containerVersus(
              posicion: 3,
              ingreso: _.generalVersus[2]['ingreso'],
              egreso: _.generalVersus[2]['egreso'],
            ),
            containerVersus(
              posicion: 4,
              ingreso: _.generalVersus[3]['ingreso'],
              egreso: _.generalVersus[3]['egreso'],
            ),
            containerVersus(
              posicion: 5,
              ingreso: _.generalVersus[4]['ingreso'],
              egreso: _.generalVersus[4]['egreso'],
            ),
            containerVersus(
              posicion: 6,
              ingreso: _.generalVersus[5]['ingreso'],
              egreso: _.generalVersus[5]['egreso'],
            ),
            containerVersus(
              posicion: 7,
              ingreso: _.generalVersus[6]['ingreso'],
              egreso: _.generalVersus[6]['egreso'],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Servicios ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Tooltip(
                                message: 'Cantidad',
                                child: Container(
                                  height: 32,
                                  child: Text(
                                    '#',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                _.servicesSalesStats.result!.count
                                        ?.toString() ??
                                    '-',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Tooltip(
                                message: 'Ingresos',
                                child: Image(
                                  image:
                                      AssetImage('assets/images/increase.png'),
                                  height: 32,
                                ),
                              ),
                              Text(
                                _.servicesSalesStats.result!.amount
                                        ?.toStringAsFixed(2) ??
                                    '-',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
          ],
        );
      },
    );
  }
}

Widget containerVersus({
  required int posicion,
  String? ingreso,
  String? egreso,
}) {
  final double numIngreso = ingreso != '-' ? double.parse(ingreso!) : 0;
  final double numEgreso = egreso != '-' ? double.parse(egreso!) : 0;
  double numRendimiento =
      ((numIngreso - numEgreso) / (numEgreso == 0 ? 1 : numEgreso)) * 100;

  return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 22,
              width: 22,
              child: svgProducto[posicion],
            ),
            SizedBox(width: 7.5),
            Text(
              txtProducto[posicion]!,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Tooltip(
                      message: 'Ingresos',
                      child: Image(
                        image: AssetImage('assets/images/increase.png'),
                        height: 32,
                      ),
                    ),
                    Text(
                      ingreso!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Tooltip(
                      message: 'Egresos',
                      child: Image(
                        image: AssetImage('assets/images/decrease.png'),
                        height: 32,
                      ),
                    ),
                    Text(
                      egreso!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numRendimiento == 0
                ? Icon(
                    Icons.arrow_right,
                    size: 30,
                    color: Colors.amber,
                  )
                : numRendimiento.isNegative
                    ? Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.arrow_drop_up,
                        size: 30,
                        color: Colors.green,
                      ),
            Text(
              '${numRendimiento.toStringAsFixed(2)}%',
              style: TextStyle(),
            ),
          ],
        )
      ],
    ),
  );
}
