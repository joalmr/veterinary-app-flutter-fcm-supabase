import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/routes/routes.dart';

class GlobalMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return prefUser.tokenHas() || route == '/login'
        ? null
        : RouteSettings(name: NameRoutes.login);
  }
}
