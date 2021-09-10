import 'dart:developer';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:number_selection/number_selection.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/products/expenses/domain/expenses.controller.dart';
import 'package:vet_app/src/products/sales/presentation/sales/data/svg_venta.dart';
import 'package:vet_app/src/products/sales/presentation/sales/data/tipo_venta.dart';

class AddExpensesView extends StatelessWidget {
  final priceController = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
  );
  final productoController = TextEditingController();
  int tipoProducto = 0;
  int cantidad = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExpensesController>(
      init: ExpensesController(),
      builder: (_) {
        return MainLayout(
          title: 'Gastos',
          drawerActive: true,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    showBarModalBottomSheet(
                        context: context,
                        expand: true,
                        builder: (context) {
                          return Stack(
                            children: [
                              Container(),
                              Positioned(
                                bottom: -50,
                                right: -65,
                                child: Icon(
                                  Icons.shopping_cart_rounded,
                                  size: 350,
                                  color: colorMain.withOpacity(0.1),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    child: CoolDropdown(
                                      dropdownList: itemListSales,
                                      placeholder: 'Seleccione tipo',
                                      onChange: (selectedItem) {},
                                      dropdownWidth: double.maxFinite,
                                      dropdownBoxHeight: 320,
                                      dropdownBoxWidth: 220,
                                      dropdownBD: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: TextFormField(
                                      controller: productoController,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      decoration: InputDecoration(
                                        labelText: 'Nombre',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: TextFormField(
                                      controller: priceController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: 'Precio',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        left: 10,
                                        right: 10,
                                      ),
                                      child: Text('Cantidad'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 0,
                                      bottom: 5,
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Container(
                                      height: 50,
                                      padding: EdgeInsets.all(2.5),
                                      child: NumberSelection(
                                        theme: NumberSelectionTheme(
                                          iconsColor: Colors.white,
                                          outOfConstraintsColor:
                                              Colors.deepOrange,
                                        ),
                                        initialValue: 1,
                                        minValue: 1,
                                        maxValue: 1000,
                                        direction: Axis.horizontal,
                                        withSpring: false,
                                        onChanged: (int value) {},
                                        enableOnOutOfConstraintsAnimation: true,
                                        onOutOfConstraints: () {},
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  btnSecondary(
                                    text: 'Agregar',
                                    onPressed: () {
                                      if (cantidad == 0 ||
                                          tipoProducto == 0 ||
                                          productoController.text.isEmpty ||
                                          priceController.numberValue == 0) {
                                        log('Complete los datos');
                                      } else {
                                        Get.back();
                                      }
                                    },
                                  ),
                                  SizedBox(height: 45),
                                ],
                              ),
                            ],
                          );
                        });
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
                    'Agregar producto',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
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
                                Row(
                                  children: [
                                    Container(
                                      height: 18,
                                      width: 18,
                                      child: svgProducto[1],
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Prueba',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Cantidad: 1',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Prueba',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.delete_rounded,
                                      color: colorRed,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                      'Prueba',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: btnPrimary(
                  text: 'Finalizar',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
