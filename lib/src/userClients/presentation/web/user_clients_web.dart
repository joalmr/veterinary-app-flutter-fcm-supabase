import 'package:flutter/material.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/src/userClients/presentation/app/user_clients_app.dart';

class UserClientsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: UserClientsApp(),
      // Row(
      //   children: [
      //     Expanded(flex: 2, child: UserClientsApp()
      //         // Container(
      //         //   child: Column(
      //         //     children: const [
      //         //       Text('Para usar esta función descargue la app de su store.'),
      //         //     ],
      //         //   ),
      //         // ),
      //         ),
      //   ],
      // ),
    );
  }
}
