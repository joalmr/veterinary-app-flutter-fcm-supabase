import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/src/calendar/domain/calendarController.dart';
import 'calendar/calendarEventView.dart';
import 'newEventDate.dart';

class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      builder: (_){
        return Scaffold(
          drawer: MenuDrawer(),
          appBar: AppBar(title: Text('Calendario'),),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add_rounded),
            onPressed: () => Get.to(NewEventDate()),
          ),
          body: CalendarEventView(),
        );
      },
    );
  }
}
