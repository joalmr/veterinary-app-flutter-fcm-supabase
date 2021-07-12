import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigation_bar.dart';
import 'package:vet_app/src/userClients/presentation/app/user_clients_app.dart';

class UserClientsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBar(),
          Expanded(flex: 2, child: UserClientsApp()
              // Container(
              //   child: Column(
              //     children: const [
              //       Text('Para usar esta función descargue la app de su store.'),
              //     ],
              //   ),
              // ),
              ),
        ],
      ),
    );
  }
}
