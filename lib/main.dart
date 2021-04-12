import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'design/theme/theme.dart';
import 'routes/routes.dart';
import 'src/__global/domain/globalController.dart';
import 'src/home/domain/homeController.dart';

main() async {
  setPathUrlStrategy();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    Get.put(HomeController());
    // Get.put(EstablishmentsController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proypet',
      theme: temaClaro,
      getPages: AppPages.pages,
      initialRoute: NameRoutes.splash,
      defaultTransition: Transition.fadeIn,
    );
  }
}
