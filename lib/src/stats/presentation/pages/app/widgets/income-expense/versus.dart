import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/products/data/svg_venta.dart';
import 'package:vet_app/src/products/data/text_products.dart';
import 'package:vet_app/src/stats/domain/stats_controller.dart';

class VersusSales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatsController>(builder: (_) {
      return ListView(
        children: [
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
                  'Servicios -prueba',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/increase.png'),
                        height: 45,
                      ),
                      Text(
                        '78.99',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
        ],
      );
    });
  }
}

Widget containerVersus({
  required int posicion,
  String? ingreso,
  String? egreso,
}) {
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
              height: 28,
              width: 28,
              child: svgProducto[posicion],
            ),
            SizedBox(width: 7.5),
            Text(
              txtProducto[posicion]!,
              style: TextStyle(
                fontSize: 28,
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
                    Image(
                      image: AssetImage('assets/images/increase.png'),
                      height: 45,
                    ),
                    Text(
                      ingreso!,
                      style: TextStyle(
                        fontSize: 28,
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
                    Image(
                      image: AssetImage('assets/images/decrease.png'),
                      height: 45,
                    ),
                    Text(
                      egreso!,
                      style: TextStyle(
                        fontSize: 28,
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
  );
}
