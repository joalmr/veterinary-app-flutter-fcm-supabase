import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/products/expenses/domain/my_expenses_controller.dart';

class ExpensesMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyExpensesController>(
      builder: (_) {
        return MainLayout(
          drawerActive: true,
          title: 'Gastos',
          body: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    alignment: Alignment.center,
                    primary: colorMain,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child: Text(
                    'Agregar egreso',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () async {},
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
                                    'Prueba',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text('Prueba'),
                                  SizedBox(height: 2.5),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Prueba',
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
              ),
            ],
          ),
        );
      },
    );
  }
}
