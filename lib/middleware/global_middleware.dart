import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/routes/routes.dart';

class GlobalMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (prefUser.tokenHas() == true || route == '/login') {
      return null;
    } else {
      return RouteSettings(name: NameRoutes.login);
    }
  }
}
