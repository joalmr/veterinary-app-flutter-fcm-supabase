import 'package:flutter/material.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/src/calendar/presentation/pages/app/calendar/calendar_event_view.dart';

class CalendarPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: CalendarEventView(),
      ),
    );
    // Scaffold(
    //   body: SizedBox(
    //     height: MediaQuery.of(context).size.height,
    //     width: MediaQuery.of(context).size.width,
    //     child: Row(
    //       children: [
    //         NavigationBar(),
    //         Expanded(
    //           child: CalendarEventView(),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
