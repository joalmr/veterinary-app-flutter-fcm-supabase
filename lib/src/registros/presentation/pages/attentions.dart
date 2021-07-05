import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/attentions_controller.dart';
import 'app/attention_app.dart';
import 'web/attention_web.dart';

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
