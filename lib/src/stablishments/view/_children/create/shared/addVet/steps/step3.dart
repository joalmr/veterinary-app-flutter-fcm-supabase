import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/assets/utils/diaSemana.dart';
import 'package:vet_app/src/stablishments/view/_children/create/shared/addVet/components/checkHorario.dart';

class Step3 extends StatelessWidget {
  const Step3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          SizedBox(height: 15),
          Text(
            'Personal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(),
          Text('Tipo'),
          TextFormField(),
          SizedBox(height: 5),
          Text('Nombre y apellido'),
          TextFormField(),
          SizedBox(height: 15),
          Text(
            'Horario',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(),
          for (var i = 0; i < 7; i++)
            CheckHorario(
              dia: diaSemana[i],
            ),
          SizedBox(height: 15),
          Text(
            'Precios',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(),
          Text('Consulta'),
          TextFormField(
            inputFormatters: [CurrencyTextInputFormatter(symbol: 'S/ ')],
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 5),
          Text('Desparasitación'),
          TextFormField(
            inputFormatters: [CurrencyTextInputFormatter(symbol: 'S/ ')],
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 5),
          Text('Vacuna'),
          TextFormField(
            inputFormatters: [CurrencyTextInputFormatter(symbol: 'S/ ')],
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 5),
          Text('Grooming'),
          TextFormField(
            inputFormatters: [CurrencyTextInputFormatter(symbol: 'S/ ')],
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
