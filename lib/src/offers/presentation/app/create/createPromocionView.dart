import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:vet_app/components/buttons.dart';

class CreaPromocionView extends StatefulWidget {
  const CreaPromocionView({Key key}) : super(key: key);

  @override
  _CreaPromocionViewState createState() => _CreaPromocionViewState();
}

class _CreaPromocionViewState extends State<CreaPromocionView> {
  int selectValue = 0;

  @override
  Widget build(BuildContext context) {
    var moneyController = new MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: '.',
      thousandSeparator: '',
      precision: 2,
      leftSymbol: 'S/ ',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Crea promoción'),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10, right: 10),
        children: [
          Text('Servicio'),
          Container(
            height: 40,
            width: double.maxFinite,
            color: Colors.pink,
            child: Text('seleccione servicio'),
          ),
          SizedBox(height: 10),
          Text('Descripción'),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            maxLength: 150,
            maxLines: 5,
          ),
          SizedBox(height: 10),
          Text('Tipo'),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: 0,
            groupValue: selectValue,
            onChanged: (val) {
              setState(() {
                selectValue = val;
                print(selectValue);
              });
            },
            title: Text('Monto de descuento'),
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: 1,
            groupValue: selectValue,
            onChanged: (val) {
              setState(() {
                selectValue = val;
                print(selectValue);
              });
            },
            title: Text('Porcentaje de descuento'),
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: 2,
            groupValue: selectValue,
            onChanged: (val) {
              setState(() {
                selectValue = val;
                print(selectValue);
              });
            },
            title: Text('Precio promocional'),
          ),
          SizedBox(height: 10),
          Text('Monto'),
          TextFormField(
            controller: moneyController,
            keyboardType: TextInputType.number,
            // inputFormatters: [CurrencyTextInputFormatter(symbol: 'S/')],
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
    );
    // return GetBuilder<OffersController>(
    //   builder: (_) {

    //   },
    // );
  }
}
