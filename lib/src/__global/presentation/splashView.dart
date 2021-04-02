import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/images/images.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/__global/domain/globalController.dart';

//GetWidget<GlobalController>
class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      init: GlobalController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: colorMain,
          body: Center(
            child: FadeIn(
              child: Hero(
                tag: 'logo',
                child: Image(
                  width: 275,
                  image: AssetImage(imgLogoProypet),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
