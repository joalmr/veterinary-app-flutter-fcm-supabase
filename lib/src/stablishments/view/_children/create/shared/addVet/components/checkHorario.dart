import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

class CheckHorario extends StatefulWidget {
  final String dia;
  CheckHorario({
    this.dia,
  });

  @override
  _CheckHorarioState createState() => _CheckHorarioState();
}

class _CheckHorarioState extends State<CheckHorario> {
  bool valueCheck = false;

  final iniciaController = TextEditingController();
  final finController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    valueCheck = !valueCheck;
                  });
                },
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: valueCheck
                      ? Icon(
                          Icons.check_box_rounded,
                          color: colorMain,
                          size: 22,
                        )
                      : Icon(
                          Icons.check_box_outline_blank_rounded,
                          color: colorMain,
                          size: 22,
                        ),
                ),
              ),
              SizedBox(width: 7.5),
              Text(widget.dia)
            ],
          ),
          valueCheck
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Inicio'),
                    SizedBox(height: 2.5),
                    TextFormField(
                      controller: iniciaController,
                      enabled: valueCheck,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 5),
                    Text('Fin'),
                    SizedBox(height: 2.5),
                    TextFormField(
                      enabled: iniciaController.text.isNotEmpty ? true : false,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 5),
                  ],
                )
              : SizedBox(height: 0),
        ],
      ),
    );
  }
}
