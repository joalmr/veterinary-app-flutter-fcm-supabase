import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/src/products/sales/domain/my_sales_controller.dart';

import 'data/svg_venta.dart';

class SaleDetail extends StatelessWidget {
  final String date;
  final String name;

  const SaleDetail({
    required this.date,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<MySalesController>(
      builder: (_) {
        return MainLayout(
          title: name,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child:
                    Align(alignment: Alignment.centerLeft, child: Text(date)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _.salesDetail.length,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                  itemBuilder: (BuildContext context, int index) {
                    final sale = _.salesDetail[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 7.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 2.5),
                                Row(
                                  children: [
                                    Container(
                                      height: 18,
                                      width: 18,
                                      child: svgProducto[sale.productTypeId],
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      sale.name!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text('Cantidad: ${sale.quantity}'),
                                SizedBox(height: 2.5),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                sale.price!.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _.totalSales.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
