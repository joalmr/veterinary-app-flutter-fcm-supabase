import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/calendar/domain/calendar_controller.dart';
import '../event/event_next_date.dart';

class EventsNextDate extends StatelessWidget {
  const EventsNextDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(
      builder: (_) {
        return Expanded(
          child: ListView.builder(
            itemCount: _.calendarNextdates.length,
            itemBuilder: (BuildContext context, int index) {
              final nextDate = _.calendarNextdates[index];
              return EventNextDate(
                image: nextDate.petPicture!,
                petName: nextDate.petName!,
                petBreed: nextDate.petBreed!,
                motivo: nextDate.reason!,
                userName: nextDate.userName!,
                userPhone: '??!!', //TODO: VERIFICAR
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
