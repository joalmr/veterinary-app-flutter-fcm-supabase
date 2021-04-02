import 'package:flutter/material.dart';
import 'package:vet_app/src/attentions/presentation/pages/app/widgets/cardAtencion.dart';

class AtencionesView extends StatelessWidget {
  const AtencionesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.only(left: 10, right: 10),
      itemBuilder: (BuildContext context, int index) {
        return CardAtencion(
          image: AssetImage('assets/images/dog.jpg'),
          petName: 'Fido',
          petBreed: 'Labrador',
          date: '20-02-2021',
          time: '14:00',
        );
      },
    );
  }
}
