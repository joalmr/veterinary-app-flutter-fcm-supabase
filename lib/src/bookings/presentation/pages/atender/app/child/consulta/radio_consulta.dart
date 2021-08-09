import 'package:flutter/material.dart';

class RadioConsulta extends StatefulWidget {
  final String selectValue;

  const RadioConsulta({required this.selectValue});

  @override
  _RadioConsultaState createState() =>
      _RadioConsultaState(selectValue: selectValue);
}

class _RadioConsultaState extends State<RadioConsulta> {
  String selectValue;
  _RadioConsultaState({required this.selectValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Row(
            children: [
              Radio(
                value: 'Presumptive',
                groupValue: selectValue,
                onChanged: (String? val) {
                  setState(() {
                    selectValue = val!;
                  });
                },
              ),
              const Text('Presuntivo'),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              Radio(
                value: 'Confirmed',
                groupValue: selectValue,
                onChanged: (String? val) {
                  setState(() {
                    selectValue = val!;
                  });
                },
              ),
              const Text('Confirmado'),
            ],
          ),
        ),
      ],
    );
  }
}
