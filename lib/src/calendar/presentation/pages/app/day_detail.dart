import 'package:flutter/material.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/calendar/presentation/widgets/event/event_booking.dart';
import 'package:vet_app/src/calendar/presentation/widgets/event/event_next_date.dart';
import 'package:vet_app/src/calendar/presentation/widgets/event/event_note.dart';

class DayDetail extends StatelessWidget {
  final String day;
  final List<dynamic> listaBooking;
  final List<dynamic> listaEvent;
  final List<dynamic> listaNextDate;

  const DayDetail(
      {required this.day,
      required this.listaBooking,
      required this.listaEvent,
      required this.listaNextDate});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: day,
      body: DefaultTabController(
        length: 3,
        initialIndex: listaNextDate.isNotEmpty
            ? 1
            : listaBooking.isNotEmpty
                ? 0
                : 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaQuery.of(context).size.width >= 900
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 25.0,
                      bottom: 10.0,
                    ),
                    child: Text(
                      day,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  )
                : SizedBox(height: 0),
            const TabBar(
              indicatorColor: colorMain,
              labelColor: colorMain,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black54,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              tabs: [
                Tab(text: 'Atenciones'),
                Tab(text: 'Próximas citas'),
                Tab(text: 'Otros eventos'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        if (listaBooking.isEmpty)
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Center(child: Text('No tiene registros')),
                          )
                        else
                          const SizedBox(height: 0),
                        for (var booking in listaBooking)
                          EventBooking(
                            color: colorBlue,
                            image: booking.petPicture,
                            petName: booking.petName,
                            petBreed: booking.petBreed,
                            time: booking.time,
                            userName: booking.userName,
                            status: booking.bookingStatus,
                          )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        if (listaNextDate.isEmpty)
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Center(child: Text('No tiene registros')),
                          )
                        else
                          const SizedBox(height: 0),
                        for (var nextDate in listaNextDate)
                          EventNextDate(
                            image: nextDate.petPicture,
                            petId: nextDate.petId,
                            petName: nextDate.petName,
                            petBreed: nextDate.petBreed,
                            motivo: nextDate.reason,
                            userName: nextDate.userName,
                            userPhone: nextDate.userPhone,
                            firstPush: true,
                            secondPush: false,
                          )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        if (listaEvent.isEmpty)
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Center(child: Text('No tiene registros')),
                          )
                        else
                          const SizedBox(height: 0),
                        for (var event in listaEvent)
                          EventNote(
                            color: Colors.blueGrey,
                            title: event.title,
                            time: event.time,
                            members: event.members,
                            description: event.description,
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
