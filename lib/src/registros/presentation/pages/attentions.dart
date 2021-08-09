import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import '../../domain/attentions_controller.dart';
import 'app/attention_app.dart';
import 'app/filtros/filtros_view.dart';
import 'web/attention_web.dart';

class AttentionsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttentionsController>(
      init: AttentionsController(),
      builder: (_) {
        return MainLayout(
          drawerActive: true,
          title: 'Registros',
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_alt_rounded),
              onPressed: () => Get.to(FiltroAtenciones()),
            ),
          ],
          body: context.width < 900 ? AttentionView() : AttentionPage(),
        );
      },
    );
  }
}
