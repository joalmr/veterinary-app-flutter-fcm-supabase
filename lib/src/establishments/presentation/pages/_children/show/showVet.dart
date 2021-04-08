import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/show/showVetController.dart';

import 'app/showVetView.dart';
import 'web/showVetPage.dart';

class ShowVetMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowVetController>(
      init: ShowVetController(),
      builder: (_) {
        return context.width < 900 ? ShowVetView() : ShowVetPage();
      },
    );
  }
}
