import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/dontExit.dart';

import 'app/userClientsApp.dart';
import 'web/userClientsWeb.dart';

class UserClientsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DontExit(
      child: context.width < 900 ? UserClientsApp() : UserClientsWeb(),
    );
  }
}
