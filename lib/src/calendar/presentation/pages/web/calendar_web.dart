import 'package:flutter/material.dart';
import 'package:vet_app/src/calendar/presentation/pages/app/calendar/calendar_event_view.dart';

class CalendarPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: CalendarEventView(),
    );
  }
}
