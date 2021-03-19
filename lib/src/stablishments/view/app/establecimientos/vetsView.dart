import 'package:flutter/material.dart';
import 'components/CardVet.dart';

class VetsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CardEstablecimiento(
          image: AssetImage('assets/images/logo.jpg'),
          name: 'Vet Patita',
          ruc: '20202020201',
          email: 'name@mail.com',
          aprobado: 1,
          tipo: 1,
        ),
        CardEstablecimiento(
          image: AssetImage('assets/images/logo.jpg'),
          name: 'Cochi',
          ruc: '20202020202',
          email: 'name2@mail.com',
          aprobado: 0,
          tipo: 2,
        ),
      ],
    );
    // return ListView.builder(
    //   itemCount: 2,
    //   itemBuilder: (BuildContext context, int index) {
    //     return ;
    //   },
    // );
  }
}
