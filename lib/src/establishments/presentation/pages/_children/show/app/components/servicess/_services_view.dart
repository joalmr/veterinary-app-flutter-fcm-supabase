import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/icons_map.dart';
import 'package:vet_app/src/establishments/domain/show/show_vet_controller.dart';

import 'edit_services_view.dart';

class ServicesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ShowVetController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 10.0,
                  bottom: 5.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Servicios',
                      style: Get.textTheme.subtitle2!.apply(fontWeightDelta: 2),
                    ),
                    GetPlatform.isWeb
                        ? SizedBox(height: 0)
                        : IconButton(
                            splashRadius: 20,
                            iconSize: 18,
                            icon: const Icon(
                              Icons.edit,
                            ),
                            onPressed: () {
                              Get.to(EditServicesView());
                            },
                          ),
                  ],
                ),
              ),
              for (var i = 0; i < _.establishment.value.services!.length; i++)
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: colorMain, //Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 3.0,
                              spreadRadius: 2.0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            iconNum[_.establishment.value.services![i].id],
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        textMap[_.establishment.value.services![i].id]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
