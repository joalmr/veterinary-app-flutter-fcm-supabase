import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/recursos/images/images.dart';
import 'package:vet_app/src/__global/domain/globalController.dart';

//GetWidget<GlobalController>
class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      // init: GlobalController(),
      builder: (_) {
        return Scaffold(
          // backgroundColor: colorMain,
          body: Center(
            child: FadeIn(
              duration: Duration(milliseconds: 1750),
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
