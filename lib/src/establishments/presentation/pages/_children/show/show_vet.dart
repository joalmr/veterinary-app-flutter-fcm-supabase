import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/show/show_vet_controller.dart';

import 'app/show_vet_view.dart';

class ShowVetMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowVetController>(
      init: ShowVetController(),
      builder: (_) {
        return context.width < 900 ? ShowVetView() : Container(color: colorRed);
      },
    );
  }
}
