import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/subheader.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CreaOferta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var moneyController = new MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: '.',
      thousandSeparator: '',
      precision: 2,
      leftSymbol: 'S/ ',
    );

    return Container(
      color: Color(0xffF7F7FF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.0),
          subHeader(title: 'Nueva oferta'),
          SizedBox(height: 10.0),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 10, right: 10),
              children: [
                Text('Monto'),
                TextFormField(
                  controller: moneyController,
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: double.infinity,
                    child: btnPrimary(
                      text: 'Crear',
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
