import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/home/domain/controller/homeController.dart';

import 'app/homeApp.dart';
import 'web/homeWeb.dart';

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return context.width < 900 ? HomePageApp() : HomePageWeb();
      },
    );
  }
}
