import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigation_bar.dart';
import 'calendar/calendar_page.dart';

class CalendarPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: const [
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
