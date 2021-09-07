import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/sales/domain/sales.controller.dart';
import 'package:vet_app/src/sales/presentation/sales/sale_detail.dart';

class SalesMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<SalesController>(
      builder: (_) {
        return MainLayout(
          drawerActive: true,
          title: 'Ventas',
          body: _.mySales.isEmpty
              ? Center(
                  child: Icon(
                    Icons.shopping_cart_rounded,
                    size: 350,
                    color: Colors.grey.withOpacity(0.15),
                  ),
                )
              : ListView.builder(
                  itemCount: _.mySales.length,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  itemBuilder: (BuildContext context, int index) {
                    final mySale = _.mySales[index];
                    return InkWell(
                      onTap: () async {
                        await _.getSaleDetail(mySale.id!);
                        Get.to(SaleDetail(
                          name: mySale.petlover!.name!,
                          date: formatDateTime(mySale.registeredAt!),
                        ));
                      },
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
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
                                  Text(
                                    mySale.petlover!.name!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(formatDateTime(mySale.registeredAt!)),
                                  SizedBox(height: 2.5),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  mySale.price!.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
