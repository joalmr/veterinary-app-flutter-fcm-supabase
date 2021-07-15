import 'package:flutter/material.dart';
import 'package:vet_app/design/layout/main_layout.dart';
// import 'package:get/get.dart';
// import 'app/user_clients_app.dart';
// import 'web/user_clients_web.dart';

class UserClientsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Clientes',
      drawerActive: true,
      body: Center(
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/images/folder-bro.png'),
                  height: 180,
                ),
                Text(
                  'Próximamente!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Text(
                  'En este modulo podrás gestionar clientes',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
