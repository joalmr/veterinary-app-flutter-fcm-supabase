import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/calendar/domain/calendar_controller.dart';
import '../event/event_booking.dart';

class EventsBooking extends StatelessWidget {
  const EventsBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(
      builder: (_) {
        return Expanded(
          child: ListView.builder(
            itemCount: _.calendarBookings.length,
            itemBuilder: (BuildContext context, int index) {
              final booking = _.calendarBookings[index];
              return EventBooking(
                color: colorBlue,
                image: booking.petPicture!,
                petName: booking.petName!,
                petBreed: booking.petBreed!,
                time: '14:00',
                userName: booking.userName!,
                status: booking.bookingStatus!,
              );
            },
          ),
        );
      },
    );
  }
}
