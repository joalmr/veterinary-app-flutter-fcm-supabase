import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/images/images.dart';
import 'package:vet_app/src/__global/domain/global_controller.dart';

//GetWidget<GlobalController>
class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      builder: (_) {
        return Scaffold(
          body: SizedBox(
            child: Center(
              child: FadeInImage(
                placeholder: AssetImage(imgEmpty),
                height: 70,
                image: AssetImage(imgLogoProypet),
                fadeInDuration: const Duration(milliseconds: 400),
                fadeOutDuration: const Duration(milliseconds: 800),
              ),
            ),
          ),
        );
      },
    );
  }
}
