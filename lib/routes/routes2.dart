// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:vet_app/routes/routes.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:vet_app/src/__global/presentation/splash_view.dart';
// import 'package:vet_app/src/_auth/presentation/login/pages/login.dart';
// import 'package:vet_app/src/_error404/view_404.dart';
// import 'package:vet_app/src/bookings/presentation/pages/atender/atender_main.dart';
// import 'package:vet_app/src/calendar/presentation/pages/calendar.dart';
// import 'package:vet_app/src/chat/presentation/chats_main.dart';
// import 'package:vet_app/src/config/presentation/pages/config_main.dart';
// import 'package:vet_app/src/establishments/presentation/pages/establishments.dart';
// import 'package:vet_app/src/home/presentation/pages/home.dart';
// import 'package:vet_app/src/offers/presentation/pages/offers.dart';
// import 'package:vet_app/src/stats/presentation/pages/stats.dart';
// import 'package:vet_app/src/userClients/presentation/user_clients.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return _fadeRoute(SplashView(), NameRoutes.splash);
//       case '/login':
//         return _fadeRoute(LoginMain(), NameRoutes.login);
//       case '/home':
//         return _fadeRoute(HomeMain(), NameRoutes.home);
//       case '/calendar':
//         return _fadeRoute(CalendarMain(), NameRoutes.calendar);
//       case '/attentions':
//         return _fadeRoute(AtenderMain(), NameRoutes.attentions);
//       case '/stats':
//         return _fadeRoute(StatsMain(), NameRoutes.stats);
//       case '/offers':
//         return _fadeRoute(OffersMain(), NameRoutes.offers);
//       case '/establishments':
//         return _fadeRoute(EstablishmentsMain(), NameRoutes.establishments);
//       case '/chats':
//         return _fadeRoute(ChatsMain(), NameRoutes.chats);
//       case '/clients':
//         return _fadeRoute(UserClientsMain(), NameRoutes.clientes);
//       case '/config':
//         return _fadeRoute(ConfigMain(), NameRoutes.config);
//       default:
//         return _fadeRoute(View404(), '/404');
//     }
//   }

//   static PageRoute _fadeRoute(Widget child, String routeName) {
//     return PageRouteBuilder(
//       settings: RouteSettings(name: routeName),
//       pageBuilder: (_, __, ___) => child,
//       // transitionDuration: Duration(milliseconds: 200),
//       // transitionsBuilder: (_, animation, __, ___) => (kIsWeb)
//       //     ? FadeTransition(
//       //         opacity: animation,
//       //         child: child,
//       //       )
//       //     : CupertinoPageTransition(
//       //         primaryRouteAnimation: animation,
//       //         secondaryRouteAnimation: __,
//       //         child: child,
//       //         linearTransition: true,
//       //       ),
//     );
//   }
// }
