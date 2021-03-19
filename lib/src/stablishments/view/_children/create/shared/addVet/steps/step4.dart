import 'package:flutter/material.dart';

class Step4 extends StatelessWidget {
  const Step4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          Text('Descripción'),
          TextFormField(
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
