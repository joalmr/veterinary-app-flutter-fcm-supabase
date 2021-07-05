import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/config/domain/config_controller.dart';

class ConfigView extends StatelessWidget {
  const ConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      builder: (_) {
        return Scaffold(
          drawer: const MenuDrawer(),
          appBar: AppBar(
            title: const Text('Configuración'),
          ),
          body: Container(
            margin: const EdgeInsets.only(left: 32.0),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Eliminar'),
                    content: const Text('Seguro que desea cerrar sesión?'),
                    actions: <Widget>[
                      btnAltern(
                        text: 'Sí, cerrar',
                        bold: true,
                        color: colorRed,
                        onPressed: () {
                          _.logOut();
                          Get.back();
                        },
                      ),
                      btnAltern(
                        text: 'Cancelar',
                        bold: true,
                        onPressed: () => Get.back(),
                      ),
                    ],
                  ),
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                alignment: Alignment.center,
                side: const BorderSide(
                  color: colorRed,
                ),
              ),
              child: const Text(
                'Cerrar sesión',
                style: TextStyle(
                  color: colorRed,
                  // fontSize: 20,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
