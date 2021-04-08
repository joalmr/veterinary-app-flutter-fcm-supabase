import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/show/showVetController.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/show/app/widgets/slideItem.dart';

class EditSlidesView extends StatelessWidget {
  const EditSlidesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowVetController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Editar imágenes'),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  for (var i = 0; i < _.establishment.slides.length; i++)
                    SlideItem(
                      onPressedDelete: () {},
                      img: _.establishment.slides[i],
                    ),
                  // SlideItem(
                  //   onPressed: () {},
                  //   img: _.establishment.slides[1],
                  // ),
                  SizedBox(height: 10),
                  btnSecondary(
                    text: 'Subir imagen',
                    onPressed: _.establishment.slides.length == 2
                        ? () {
                            Get.snackbar(
                              'Advertencia',
                              'Alcanzaste el límite de imágenes',
                              backgroundColor: colorYellow,
                            );
                          }
                        : _.seleccionarSlide,
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
