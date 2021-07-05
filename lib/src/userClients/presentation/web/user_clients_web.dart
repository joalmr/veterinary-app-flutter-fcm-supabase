import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigation_bar.dart';

class UserClientsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NavigationBar(),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: const [
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
