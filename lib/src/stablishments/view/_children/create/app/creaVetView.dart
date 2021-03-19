import 'package:flutter/material.dart';
import 'package:vet_app/src/stablishments/view/_children/create/shared/addVet.dart';

class CreaVetView extends StatelessWidget {
  const CreaVetView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          color: Colors.pink,
        ),
        title: Text('Crea establecimiento'),
        centerTitle: false,
      ),
      body: AddVet(),
    );
  }
}
