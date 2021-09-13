import 'dart:developer';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/products/expenses/domain/_expenses_model.dart';
import 'package:vet_app/src/products/expenses/domain/expenses.controller.dart';
import 'package:vet_app/src/products/data/svg_venta.dart';
import 'package:vet_app/src/products/data/tipo_venta.dart';

class AddExpensesView extends StatefulWidget {
  @override
  State<AddExpensesView> createState() => _AddExpensesViewState();
}

class _AddExpensesViewState extends State<AddExpensesView> {
  final priceController = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  final productoController = TextEditingController();
  final proveedorController = TextEditingController();
  final cantidadController = TextEditingController();

  int tipoProducto = 0;
  int cantidad = 1;

  @override
  Widget build(BuildContext context) {
    return GetX<ExpensesController>(
      init: ExpensesController(),
      builder: (_) {
        return MainLayout(
          title: 'Egresos',
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
                                  Icons.trending_down_rounded,
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
                                      onChange: (selectedItem) {
                                        setState(() {
                                          tipoProducto = selectedItem['value'];
                                        });
                                      },
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
                                      controller: proveedorController,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      decoration: InputDecoration(
                                        labelText: 'Proveedor',
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
                                        labelText: 'Producto',
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
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: NumberInputWithIncrementDecrement(
                                      controller: cantidadController,
                                      widgetContainerDecoration: BoxDecoration(
                                        border: Border.all(
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      numberFieldDecoration: InputDecoration(
                                        labelText: 'Cantidad',
                                      ),
                                      onIncrement: (value) {
                                        setState(() {
                                          cantidad = value.toInt();
                                        });
                                      },
                                      onDecrement: (value) {
                                        setState(() {
                                          cantidad = value.toInt();
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          cantidad = value.toInt();
                                        });
                                      },
                                      min: 1,
                                      initialValue: 1,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  btnSecondary(
                                    text: 'Agregar',
                                    onPressed: () {
                                      if (cantidad == 0 ||
                                          tipoProducto == 0 ||
                                          productoController.text.isEmpty ||
                                          proveedorController.text.isEmpty ||
                                          priceController.numberValue == 0) {
                                        log('Complete los datos');
                                      } else {
                                        final data = ExpensesDetailPreview(
                                            name: productoController.text,
                                            price: priceController.numberValue,
                                            quantity: cantidad,
                                            productTypeId: tipoProducto,
                                            proveedor:
                                                proveedorController.text);

                                        _.expensesList.add(data);
                                        _.getTotal();

                                        setState(() {
                                          productoController.text = '';
                                          proveedorController.text = '';
                                          cantidad = 1;
                                        });

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
                    'Agregar',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
              Expanded(
                child: _.expensesList.isEmpty
                    ? Center(
                        child: Icon(
                          Icons.trending_down_rounded,
                          size: 350,
                          color: Colors.grey.withOpacity(0.15),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _.expensesList.length,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (BuildContext context, int index) {
                          final producto = _.expensesList[index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
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
                                      Row(
                                        children: [
                                          Container(
                                            height: 18,
                                            width: 18,
                                            child: svgProducto[
                                                producto.productTypeId],
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            producto.name!,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Cantidad: ${producto.quantity}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        'Proveedor: ${producto.proveedor}',
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Text(
                                          producto.price!.toStringAsFixed(2),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _.expensesList.remove(producto);
                                          _.getTotal();
                                        },
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
                      _.totalExpenses.toStringAsFixed(2),
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
                  onPressed: _.cargando.value ? null : () => _.addExpense(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
