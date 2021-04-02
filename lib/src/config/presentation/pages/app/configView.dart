import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/config/domain/configController.dart';

class ConfigView extends StatelessWidget {
  const ConfigView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      builder: (_) {
        return Scaffold(
          drawer: MenuDrawer(),
          appBar: AppBar(
            title: Text('Configuración'),
            centerTitle: false,
          ),
          body: Container(
            margin: EdgeInsets.only(left: 32.0),
            child: TextButton(
              child: Text(
                'Cerrar sesión',
                style: TextStyle(
                  color: colorRed,
                  // fontSize: 20,
                ),
              ),
              onPressed: _.logOut,
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                alignment: Alignment.center,
                side: BorderSide(
                  color: colorRed,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
