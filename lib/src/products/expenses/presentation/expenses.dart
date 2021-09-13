import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/products/expenses/domain/my_expenses_controller.dart';
import 'package:vet_app/src/products/expenses/presentation/expenses/add_expense.dart';
import 'package:vet_app/src/products/expenses/presentation/expenses/expense_detail.dart';

class ExpensesMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<MyExpensesController>(
      builder: (_) {
        return MainLayout(
          drawerActive: true,
          title: 'Egresos',
          body: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(AddExpensesView());
                  },
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
                child: _.myExpenses.isEmpty
                    ? Center(
                        child: Icon(
                          Icons.shopping_cart_rounded,
                          size: 350,
                          color: Colors.grey.withOpacity(0.15),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _.myExpenses.length,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        itemBuilder: (BuildContext context, int index) {
                          final myExpense = _.myExpenses[index];
                          return InkWell(
                            onTap: () async {
                              await _.getExpensesDetail(myExpense.id!);
                              Get.to(ExpenseDetail(
                                date: formatDateTime(myExpense.createdAt!),
                              ));
                            },
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 7.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 2.5),
                                        Icon(Icons.trending_down_rounded),
                                        SizedBox(height: 5),
                                        Text(formatDateTime(
                                            myExpense.createdAt!)),
                                        SizedBox(height: 2.5),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        myExpense.price!.toStringAsFixed(2),
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
