import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/calendar/domain/calendarController.dart';
import '../event/eventNote.dart';

class EventsNote extends StatelessWidget {
  const EventsNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(
      builder: (_){
        return Expanded(
          child: ListView.builder(
            itemCount: _.calendarEvents.length,
            itemBuilder: (BuildContext context, int index) {
              final event = _.calendarEvents[index];
              return EventNote(
                color: Colors.blueGrey,
                title: event.title!,
                time: event.time!,
                members: event.members!,
                description: event.description!,
              );
            },
          ),
        );
      },
    );
  }
}
