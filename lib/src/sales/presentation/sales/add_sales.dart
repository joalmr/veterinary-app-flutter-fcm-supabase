import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:number_selection/number_selection.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/sales/domain/sales.controller.dart';
import 'package:vet_app/src/sales/domain/sales_model.dart';
import 'package:vet_app/src/sales/presentation/sales/data/svg_venta.dart';
import 'package:vet_app/src/sales/presentation/sales/data/tipo_venta.dart';

class AddSalesView extends StatefulWidget {
  final int petloverId;
  final String name;
  final String lastname;

  const AddSalesView({
    required this.petloverId,
    required this.name,
    required this.lastname,
  });

  @override
  _AddSalesViewState createState() => _AddSalesViewState(
        petloverId: petloverId,
        name: name,
        lastname: lastname,
      );
}

class _AddSalesViewState extends State<AddSalesView> {
  int petloverId;
  String name;
  String lastname;
  _AddSalesViewState({
    required this.petloverId,
    required this.name,
    required this.lastname,
  });

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
    return GetX<SalesController>(
      builder: (_) {
        return MainLayout(
          title: 'Venta',
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  'Cliente: $name $lastname',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: CoolDropdown(
                                  dropdownList: itemListSales,
                                  placeholder: 'Seleccione tipo de producto',
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
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(2.5),
                                        child: TextFormField(
                                          controller: priceController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: 'Precio',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
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
                                          onChanged: (int value) {
                                            setState(() {
                                              cantidad = value;
                                            });
                                          },
                                          enableOnOutOfConstraintsAnimation:
                                              true,
                                          onOutOfConstraints: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              btnSecondary(
                                text: 'Agregar',
                                onPressed: () {
                                  if (cantidad == 0 ||
                                      tipoProducto == 0 ||
                                      productoController.text.isEmpty ||
                                      priceController.numberValue == 0) {
                                    print('Complete los datos');
                                  } else {
                                    final data = SalesDetailModel(
                                      name: productoController.text,
                                      price: priceController.numberValue,
                                      quantity: cantidad,
                                      productTypeId: tipoProducto,
                                    );
                                    _.salesList.add(data);

                                    setState(() {
                                      productoController.text = '';
                                      cantidad = 1;
                                    });
                                    Get.back();
                                  }
                                },
                              ),
                              SizedBox(height: 45),
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
                child: _.salesList.isEmpty
                    ? Center(
                        child: Icon(
                          Icons.shopping_cart_rounded,
                          size: 350,
                          color: Colors.grey.withOpacity(0.15),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _.salesList.length,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (BuildContext context, int index) {
                          final producto = _.salesList[index];
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
                                          producto.price.toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _.salesList.remove(producto);
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
                padding: const EdgeInsets.all(10.0),
                child: btnPrimary(
                  text: 'Finalizar venta',
                  onPressed: _.cargando.value
                      ? null
                      : () {
                          if (petloverId == 0) {
                            snackBarMessage(
                              message: 'Oops, ocurrio un error inesperado',
                              type: TypeSnackBarName.ERROR,
                            );
                          } else {
                            _.addSale(petloverId);
                          }
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
