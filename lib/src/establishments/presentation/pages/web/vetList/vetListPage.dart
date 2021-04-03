import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';

import 'vetCard.dart';

class VetList extends StatelessWidget {
  const VetList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Establecimientos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: btnSecondary(
                    text: 'Nuevo establecimiento',
                    onPressed: () => Get.toNamed('/stablishments/create'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            child: Wrap(
              children: [
                VetCard(
                  image: AssetImage('assets/images/logo.jpg'),
                  name: 'Vet Patita',
                  ruc: '20202020201',
                  email: 'name@mail.com',
                  aprobado: 1,
                  tipo: 1,
                ),
                VetCard(
                  image: AssetImage('assets/images/logo.jpg'),
                  name: 'Cochi',
                  ruc: '20202020202',
                  email: 'name2@mail.com',
                  aprobado: 0,
                  tipo: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
