import 'package:get/get.dart';
import 'package:vet_app/middleware/globalMiddleware.dart';
import 'package:vet_app/src/__global/presentation/splashView.dart';
import 'package:vet_app/src/_auth/login/presentation/pages/login.dart';
import 'package:vet_app/src/_auth/register/presentation/pages/register.dart';
import 'package:vet_app/src/calendar/view/calendar.dart';
import 'package:vet_app/src/config/presentation/pages/configMain.dart';
import 'package:vet_app/src/home/view/home.dart';
import 'package:vet_app/src/offers/view/offers.dart';
import 'package:vet_app/src/attentions/presentation/pages/attentions.dart';
import 'package:vet_app/src/establishments/view/_children/create/creaVet.dart';
import 'package:vet_app/src/establishments/view/_children/show/showVet.dart';
import 'package:vet_app/src/establishments/view/establishments.dart';
import 'package:vet_app/src/stats/view/stats.dart';
import 'package:vet_app/src/workers/view/workers.dart';

class NameRoutes {
  static final String splash = '/';
  static final String register = '/register';
  static final String login = '/login';
  static final String home = '/home';
  static final String calendar = '/calendar';
  static final String attentions = '/attentions';
  static final String stats = '/stats';
  static final String offers = '/offers';
  static final String establishments = '/establishments';
  static final String workers = '/workers';
  static final String config = '/config';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: NameRoutes.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: NameRoutes.register,
      page: () => RegisterMain(),
    ),
    GetPage(
      name: NameRoutes.login,
      page: () => LoginMain(),
    ),
    GetPage(
      name: NameRoutes.home,
      page: () => HomeMain(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: NameRoutes.calendar,
      page: () => CalendarMain(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: NameRoutes.attentions,
      page: () => AttentionsMain(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: NameRoutes.stats,
      page: () => StatsMain(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: NameRoutes.offers,
      page: () => OffersMain(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: NameRoutes.establishments,
      page: () => EstablishmentsMain(),
      middlewares: [GlobalMiddleware()],
      children: [
        GetPage(
          name: '/create',
          page: () => CreateVetMain(),
          // binding:
        ),
        GetPage(
          name: '/show',
          page: () => ShowVetMain(),
        ),
      ],
    ),
    GetPage(
      name: NameRoutes.workers,
      page: () => WorkersMain(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: NameRoutes.config,
      page: () => ConfigMain(),
      middlewares: [GlobalMiddleware()],
    ),
  ];
}
