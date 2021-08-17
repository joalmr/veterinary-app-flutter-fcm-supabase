import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/show/show_vet_controller.dart';

import 'edit_description_view.dart';

class DescriptionView extends StatelessWidget {
  final String description;
  const DescriptionView({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowVetController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                      'Descripción',
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
                              Get.to(EditDescriptionView());
                            },
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
