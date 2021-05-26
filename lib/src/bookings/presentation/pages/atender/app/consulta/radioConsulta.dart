import 'package:flutter/material.dart';

class RadioConsulta extends StatefulWidget {

  @override
  _RadioConsultaState createState() => _RadioConsultaState();
}

class _RadioConsultaState extends State<RadioConsulta> {
  int selectValue = 0;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Row(
            children: [
              Radio(
                value: 0,
                groupValue: selectValue,
                onChanged: (val){
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
                value: 1,
                groupValue: selectValue,
                onChanged: (val){
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