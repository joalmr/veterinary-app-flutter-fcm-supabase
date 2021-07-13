import 'package:flutter/material.dart';

class View404 extends StatelessWidget {
  View404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '404',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              'Página no encontrada',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
