import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/_auth/domain/login_controller.dart';

import 'app/login.app.dart';
import 'web/login.web.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return context.width < 900 ? const LoginView() : const LoginPage();
      },
    );
  }
}
