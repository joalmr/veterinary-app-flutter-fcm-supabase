import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/calendar/domain/calendarController.dart';
import '../event/eventNextDate.dart';

class EventsNextDate extends StatelessWidget {
  const EventsNextDate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(
      builder: (_){
        return Expanded(
          child: ListView.builder(
            itemCount: _.calendarNextdates.length,
            itemBuilder: (BuildContext context, int index) {
              final nextDate = _.calendarNextdates[index];
              return EventNextDate(
                image: nextDate.petPicture,
                petName: nextDate.petName,
                petBreed: nextDate.petBreed,
                motivo: nextDate.reason,
                userName: nextDate.userName,
                userPhone: '99999999',
                firstPush: true,
                secondPush: false,
              );
            },
          ),
        );
      },
    );
  }
}
