import 'package:flutter/material.dart';
import '../event/eventNote.dart';

class EventsNote extends StatelessWidget {
  const EventsNote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return EventNote(
            color: Colors.blueGrey,
            title: 'Visitar a pakito',
            time: '14:00',
            members: 'Alonso, Luda y etc',
            description:
                'Esta es la descripcion del card bla bla bla bla, Esta es la descripcion del card bla bla bla bla, Esta es la descripcion del card bla bla bla bla',
          );
        },
      ),
    );
  }
}
