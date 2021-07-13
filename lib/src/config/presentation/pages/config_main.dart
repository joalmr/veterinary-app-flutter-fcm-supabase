import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/config_controller.dart';

import 'app/config_view.dart';
import 'web/config_page.dart';

class ConfigMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      init: ConfigController(),
      builder: (_) {
        return context.width < 900 ? const ConfigView() : ConfigPage();
      },
    );
  }
}
