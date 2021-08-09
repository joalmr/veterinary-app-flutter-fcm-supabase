import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future pushNamed(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future offNamed(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack(String routeName) {
    return navigatorKey.currentState!.pop();
  }
}
