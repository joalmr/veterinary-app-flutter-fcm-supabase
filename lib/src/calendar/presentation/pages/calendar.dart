import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/calendarController.dart';

import 'app/calendarView.dart';
import 'web/calendarWeb.dart';

class CalendarMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      init: CalendarController(),
      builder: (_) {
        return context.width < 900 ? CalendarView() : CalendarPageWeb();
      },
    );
  }
}
