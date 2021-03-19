import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigationBar.dart';
import 'calendar/calendarPage.dart';

class CalendarPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            NavigationBar(),
            Expanded(
              child: CalendarPage(),
            ),
          ],
        ),
      ),
    );
  }
}
