import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../domain/attentionsController.dart';

import 'app/attentionApp.dart';
import 'web/attentionWeb.dart';

class AttentionsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttentionsController>(
      init: AttentionsController(),
      builder: (_) {
        return context.width < 900 ? AttentionView() : AttentionPage();
      },
    );
  }
}
