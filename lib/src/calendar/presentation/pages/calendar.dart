import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import '../../domain/calendar_controller.dart';
import 'app/calendar_view.dart';
import 'app/new_event_date.dart';
import 'web/calendar_web.dart';

class CalendarMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      // init: CalendarController(),
      builder: (_) {
        return MainLayout(
          drawerActive: true,
          title: 'Calendario',
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.to(NewEventDate()),
            child: const Icon(Icons.add_rounded),
          ),
          body: context.width < 900 ? CalendarView() : CalendarPageWeb(),
        );
      },
    );
  }
}
