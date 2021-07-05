import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigationBar.dart';

class UserClientsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBar(),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Text('Para usar esta función descargue la app de su store.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
