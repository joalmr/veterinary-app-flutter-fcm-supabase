import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

class NewEstablishment extends StatelessWidget {
  const NewEstablishment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/call-green.png'),
            height: 250,
            fit: BoxFit.cover,
          ),
          Text(
              'Comuníquese con uno de nuestros asesores para crear su establecimiento'),
          Text(
            'info@proypet.com',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: colorMain,
            ),
          ),
        ],
      ),
    );
  }
}
