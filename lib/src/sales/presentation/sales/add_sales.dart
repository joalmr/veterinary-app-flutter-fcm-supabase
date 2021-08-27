import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:number_selection/number_selection.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';

class AddSalesView extends StatelessWidget {
  final priceController = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        title: 'Venta',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, left: 10),
              child: Text(
                'Cliente: Alonso Massa',
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
                                  horizontal: 10, vertical: 5),
                              child: TextFormField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                decoration: InputDecoration(
                                  labelText: 'Tipo de producto',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: TextFormField(
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
                                      height: 45,
                                      padding: EdgeInsets.all(2.5),
                                      child: NumberSelection(
                                        theme: NumberSelectionTheme(
                                          iconsColor: Colors.white,
                                          outOfConstraintsColor:
                                              Colors.deepOrange,
                                        ),
                                        initialValue: 1,
                                        minValue: 1,
                                        maxValue: 10,
                                        direction: Axis.horizontal,
                                        withSpring: true,
                                        onChanged: (int value) =>
                                            print("value: $value"),
                                        enableOnOutOfConstraintsAnimation: true,
                                        onOutOfConstraints: () => print(
                                            "This value is too high or too low"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            btnSecondary(
                              text: 'Agregar',
                              onPressed: () {},
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
                  style: TextStyle(fontSize: 10.5),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
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
                              Text(
                                'Producto..',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Categoria..',
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
                                  '45.00',
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
              padding: const EdgeInsets.all(10.0),
              child: btnPrimary(text: 'Finalizar venta', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
