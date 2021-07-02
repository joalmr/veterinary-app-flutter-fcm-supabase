import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/dontExit.dart';
import '../../domain/configController.dart';

import 'app/configView.dart';
import 'web/configPage.dart';

class ConfigMain extends StatelessWidget {
  const ConfigMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      init: ConfigController(),
      builder: (_) {
        return DontExit(
          child: context.width < 900 ? ConfigView() : ConfigPage(),
        );
      },
    );
  }
}
