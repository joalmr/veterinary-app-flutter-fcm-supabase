import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/show/show_vet_controller.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/show/app/widgets/slide_item.dart';

class EditSlidesView extends StatelessWidget {
  const EditSlidesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowVetController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Editar imágenes'),
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  for (var i = 0; i < _.establishment.value.slides!.length; i++)
                    SlideItem(
                      onPressedDelete: () => _.eliminarSlide(
                        _.establishment.value.slides![i],
                      ),
                      img: _.establishment.value.slides![i],
                    ),
                  const SizedBox(height: 10),
                  Center(
                    child: btnSecondary(
                      text: 'Subir imagen',
                      onPressed: _.establishment.value.slides!.length == 2
                          ? () => Get.snackbar(
                                'Advertencia',
                                'Alcanzaste el límite de imágenes',
                                backgroundColor: colorYellow,
                                colorText: colorBrown1,
                              )
                          : _.seleccionarSlide,
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
