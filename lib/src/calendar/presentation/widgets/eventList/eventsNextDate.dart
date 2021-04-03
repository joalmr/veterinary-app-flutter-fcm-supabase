import 'package:flutter/material.dart';
import '../event/eventNextDate.dart';

class EventsNextDate extends StatelessWidget {
  const EventsNextDate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return EventNextDate(
            image: 'assets/images/dog.jpg',
            petName: 'Fido',
            petBreed: 'Cocker',
            motivo: 'Consulta',
            userName: 'Alonso Massa',
            firstPush: true,
            secondPush: false,
          );
        },
      ),
    );
  }
}
