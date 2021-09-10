import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:vet_app/src/products/sales/domain/my_sales_controller.dart';
import 'config/variables_global.dart';
import 'design/theme/theme.dart';
import 'routes/routes.dart';
import 'src/__global/domain/global_controller.dart';
import 'src/bookings/domain/booking_controller.dart';
import 'src/calendar/domain/calendar_controller.dart';
import 'src/establishments/domain/establishments_controller.dart';
import 'src/home/domain/home_controller.dart';
import 'src/registros/domain/attentions_controller.dart';
import 'src/user_clients/domain/user_clients_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await dotenv.load(fileName: '.env.dev');
  await Firebase.initializeApp(); //TODO: firebase
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
    Get.put(ClientsController());
    Get.put(GlobalController());
    //
    Get.put(BookingController());
    Get.put(MySalesController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: appPruebas,
      title: 'Proypet',
      navigatorKey: Get.key,
      theme: temaClaro,
      themeMode: ThemeMode.light,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('es', 'ES')],
      defaultTransition: Transition.fadeIn,
      initialRoute: NameRoutes.splash,
      unknownRoute: AppPages.unknownRoutePage,
      getPages: AppPages.pages,
    );
  }
}
