import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/register_controller.dart';

import 'app/register.app.dart';
import 'web/register.web.dart';

class RegisterMain extends StatelessWidget {
  const RegisterMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (_) {
        return context.width < 900
            ? const RegisterView()
            : const RegisterPage();
      },
    );
  }
}
