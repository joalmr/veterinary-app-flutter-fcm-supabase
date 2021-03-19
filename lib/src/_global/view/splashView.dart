import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/images/images.dart';
import 'package:vet_app/design/styles/styles.dart';
import '../domain/globalController.dart';

class SplashView extends GetWidget<GlobalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMain,
      body: Center(
        child: BounceInLeft(
          child: Hero(
            tag: 'logo',
            child: Image(
              width: 350,
              image: AssetImage(imgLogoProypet),
            ),
          ),
        ),
      ),
    );
  }
}
