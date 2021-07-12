import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/calendar_controller.dart';
import 'app/calendar_view.dart';
import 'web/calendar_web.dart';

class CalendarMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      // init: CalendarController(),
      builder: (_) {
        return context.width < 900 ? CalendarView() : CalendarPageWeb();
      },
    );
  }
}
