import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/domain/edit/editVetController.dart';

import 'app/showVetView.dart';
import 'web/showVetPage.dart';

class ShowVetMain extends StatelessWidget {
  final String id;
  const ShowVetMain({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditVetController>(
      builder: (_) {
        return context.width < 900 ? ShowVetView(id: id) : ShowVetPage();
      },
    );
  }
}
