import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/web/navbar/navigation_bar.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/config/domain/config_controller.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      builder: (_) {
        return Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavigationBar(),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 30.0, top: 25.0, bottom: 10.0),
                        child: const Text(
                          'Configuración',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 32.0),
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Eliminar'),
                                content: const Text(
                                    'Seguro que desea cerrar sesión?'),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
