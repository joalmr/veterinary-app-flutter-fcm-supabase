import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/_auth/domain/loginController.dart';

import 'app/loginView.dart';
import 'web/loginPage.dart';

class LoginMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return context.width < 900 ? LoginView() : LoginPage();
      },
    );
  }
}
