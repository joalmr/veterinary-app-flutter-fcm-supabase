import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/dontExit.dart';
import 'package:vet_app/src/home/domain/homeController.dart';

import 'app/homeApp.dart';
import 'web/homeWeb.dart';

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      // init: HomeController(),
      builder: (_) {
        return DontExit(
          child: context.width < 900 ? HomePageApp() : HomePageWeb(),
        );
      },
    );
  }
}
