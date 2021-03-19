import 'package:flutter/material.dart';
import 'package:vet_app/src/attentions/view/web/components/rowAttention.dart';

class Registered extends StatefulWidget {
  @override
  _RegisteredState createState() => _RegisteredState();
}

int selected = 1;

class _RegisteredState extends State<Registered> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
            child: Text(
              'Registro de atenciones',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return RowAttention(
                  petName: 'Elmer',
                  petBreed: 'Cocker',
                  date: '20-02-2021',
                  time: '14:00',
                  userName: 'Alonso Massa',
                  amount: '45.99',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
