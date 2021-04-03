import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import '../event/eventBooking.dart';

class EventsBooking extends StatelessWidget {
  const EventsBooking({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return EventBooking(
            color: colorBlue,
            image: 'assets/images/dog.jpg',
            petName: 'Fido',
            petBreed: 'Cocker',
            time: '14:00',
            userName: 'Alonso Massa',
            status: 'Atendiendo',
          );
        },
      ),
    );
  }
}
