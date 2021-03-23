import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/establishmentsController.dart';

import 'app/showVetView.dart';
import 'web/showVetPage.dart';

class ShowVetMain extends StatelessWidget {
  const ShowVetMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstablishmentsController>(
      builder: (_) {
        return context.width < 900 ? ShowVetView() : ShowVetPage();
      },
    );
  }
}
