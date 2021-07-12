import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'config/variables_global.dart';
import 'design/theme/theme.dart';
import 'routes/routes.dart';
import 'src/__global/domain/global_controller.dart';
import 'src/calendar/domain/calendar_controller.dart';
import 'src/establishments/domain/establishments_controller.dart';
import 'src/home/domain/home_controller.dart';
import 'src/registros/domain/attentions_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await dotenv.load(fileName: '.env.dev');
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(CalendarController());
    Get.put(AttentionsController());
    Get.put(EstablishmentsController());
    Get.put(GlobalController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: appPruebas,
      title: 'Proypet',
      theme: temaClaro,
      themeMode: ThemeMode.light,
      getPages: AppPages.pages,
      initialRoute: NameRoutes.splash,
      defaultTransition: Transition.fadeIn,

      // builder: (context, child) {},
    );
  }
}
