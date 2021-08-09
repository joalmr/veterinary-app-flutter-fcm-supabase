import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import '../../domain/stats_controller.dart';
import 'app/components/filter_stat_view.dart';
import 'app/stats_app.dart';
import 'web/stats_web.dart';

class StatsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatsController>(
      init: StatsController(),
      builder: (_) {
        return MainLayout(
          drawerActive: true,
          title: 'Estadísticas',
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_alt_rounded),
              onPressed: () => Get.to(const FilterStatView()),
            ),
          ],
          body: context.width < 900 ? StatsPageApp() : StatsPageWeb(),
        );
      },
    );
  }
}
