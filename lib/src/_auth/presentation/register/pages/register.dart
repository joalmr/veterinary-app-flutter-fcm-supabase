import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/registerController.dart';

import 'app/registerView.dart';
import 'web/registerPage.dart';

class RegisterMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (_) {
        return context.width < 900 ? RegisterView() : RegisterPage();
      },
    );
  }
}
