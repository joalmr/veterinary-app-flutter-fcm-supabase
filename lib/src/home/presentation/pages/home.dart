import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';
import 'app/home_app.dart';
import 'web/home_web.dart';

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      // init: HomeController(),
      builder: (_) {
        return context.width < 900 ? HomePageApp() : HomePageWeb();
      },
    );
  }
}
