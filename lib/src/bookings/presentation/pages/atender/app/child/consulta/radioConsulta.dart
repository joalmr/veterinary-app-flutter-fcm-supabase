import 'package:flutter/material.dart';

class RadioConsulta extends StatefulWidget {
  final String selectValue;

  RadioConsulta({@required this.selectValue});

  @override
  _RadioConsultaState createState() =>
      _RadioConsultaState(selectValue: selectValue);
}

class _RadioConsultaState extends State<RadioConsulta> {
  String selectValue;
  _RadioConsultaState({@required this.selectValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Row(
            children: [
              Radio(
                value: 'Presumptive',
                groupValue: selectValue,
                onChanged: 
                (val) {
                  setState(() {
                    selectValue = val;
                  });
                },
              ),
              Text('Presuntivo'),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Radio(
                value: 'Confirmed',
                groupValue: selectValue,
                onChanged: (val) {
                  setState(() {
                    selectValue = val;
                  });
                },
              ),
              Text('Confirmado'),
            ],
          ),
        ),
      ],
    );
  }
}
