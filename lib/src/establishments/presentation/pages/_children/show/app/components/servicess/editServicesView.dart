import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';

class EditServicesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar servicios'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: btnSecondary(
                text: 'Guardar',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
