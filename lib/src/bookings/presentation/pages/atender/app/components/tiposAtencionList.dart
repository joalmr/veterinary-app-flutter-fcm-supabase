import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';

Widget tipoAtencion(IconData icon, String nombre, String vista, String monto, Function onTap) {
  return monto == ''
      ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: InkWell(
            onTap: onTap,// => Get.toNamed(vista),
            child: Card(
              child: Container(
                height: 65,
                padding: EdgeInsets.all(8),
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
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        nombre,
                        style:
                            Get.textTheme.subtitle1.apply(fontWeightDelta: 2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: InkWell(
            onTap: onTap,// => Get.toNamed(vista),
            child: Dismissible(
              key: UniqueKey(),
              background: Container(color: colorRed),
              direction: DismissDirection.endToStart,
              confirmDismiss: (fn) => Get.dialog(
                AlertDialog(
                  title: Text('Eliminar'),
                  content: Text('Seguro que desea eliminar esta atención?'),
                  actions: <Widget>[
                    btnAltern(
                      text: 'Cancelar', 
                      onPressed: () => Get.back(),
                    ),
                    btnAltern(
                      text: 'Eliminar', 
                      onPressed: (){},
                      color: colorRed,
                    ),
                  ],
                ),
              ),
              child: Card(
                child: Container(
                  height: 65,
                  padding: EdgeInsets.all(8),
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
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          nombre,
                          style:
                              Get.textTheme.subtitle1.apply(fontWeightDelta: 2),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'S/ $monto',
                          style:
                              Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                        ),
                      ),
                      Icon(
                        Icons.arrow_left_rounded,
                        size: 14,
                        color: colorRed,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
}