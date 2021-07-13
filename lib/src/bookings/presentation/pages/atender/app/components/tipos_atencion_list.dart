import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';

Widget tipoAtencion({
  required IconData icon,
  required String nombre,
  required String monto,
  void Function()? onTap,
  void Function()? onDelete,
}) {
  return monto == ''
      ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Tooltip(
            message: nombre,
            child: InkWell(
              onTap: onTap,
              child: Card(
                child: Container(
                  height: 65,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: borderRadius,
                        ),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      MediaQuery.of(Get.context!).size.width < 605 &&
                              GetPlatform.isWeb
                          ? SizedBox(height: 0)
                          : Expanded(
                              child: Text(
                                nombre,
                                style: Get.textTheme.subtitle1!
                                    .apply(fontWeightDelta: 2),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: InkWell(
            onTap: onTap,
            child: Dismissible(
              key: UniqueKey(),
              background: Container(color: colorRed),
              direction: DismissDirection.endToStart,
              confirmDismiss: (fn) => Get.dialog(
                AlertDialog(
                  title: const Text('Eliminar'),
                  content:
                      const Text('Seguro que desea eliminar esta atención?'),
                  actions: <Widget>[
                    btnAltern(
                      text: 'Cancelar',
                      onPressed: () => Get.back(),
                    ),
                    btnAltern(
                      text: 'Eliminar',
                      onPressed: () {
                        onDelete!();
                        Get.back();
                      },
                      color: colorRed,
                    ),
                  ],
                ),
              ),
              child: Card(
                child: Container(
                  height: 65,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: colorMain,
                          borderRadius: borderRadius,
                        ),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      MediaQuery.of(Get.context!).size.width < 605 &&
                              GetPlatform.isWeb
                          ? SizedBox(height: 0)
                          : Expanded(
                              child: Text(
                                nombre,
                                style: Get.textTheme.subtitle1!
                                    .apply(fontWeightDelta: 2),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'S/ $monto',
                          style: Get.textTheme.subtitle2!
                              .apply(fontWeightDelta: 2),
                        ),
                      ),
                      Icon(
                        Icons.arrow_left_rounded,
                        size: 20,
                        color: colorRed,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
}
