import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/config/domain/config_controller.dart';

class ConfigPage extends StatelessWidget {
  ConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      builder: (_) {
        return MainLayout(
          child: Expanded(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
                    child: Text(
                      'Configuración',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 32.0),
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Eliminar'),
                            content: Text('Seguro que desea cerrar sesión?'),
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
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        alignment: Alignment.center,
                        side: BorderSide(
                          color: colorRed,
                        ),
                      ),
                      child: Text(
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
        );
      },
    );
  }
}
