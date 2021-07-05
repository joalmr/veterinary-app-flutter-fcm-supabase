import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/calendar/presentation/widgets/event/eventBooking.dart';
import 'package:vet_app/src/calendar/presentation/widgets/event/eventNextDate.dart';
import 'package:vet_app/src/calendar/presentation/widgets/event/eventNote.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(day),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: listaNextDate.isNotEmpty
            ? 1
            : listaBooking.isNotEmpty
                ? 0
                : 2,
        child: Column(
          children: [
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
                        listaBooking.length == 0
                            ? Padding(
                                padding: EdgeInsets.only(top: 20),
                                child:
                                    Center(child: Text('No tiene registros')),
                              )
                            : SizedBox(height: 0),
                        for (var booking in listaBooking)
                          EventBooking(
                            color:
                                colorBlue, //TODO: cambiar color con el status
                            image: booking.petPicture as String,
                            petName: booking.petName as String,
                            petBreed: booking.petBreed as String,
                            time: booking.time as String,
                            userName: booking.userName as String,
                            status: booking.bookingStatus as String,
                          )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        listaNextDate.length == 0
                            ? const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child:
                                    Center(child: Text('No tiene registros')),
                              )
                            : const SizedBox(height: 0),
                        for (var nextDate in listaNextDate)
                          EventNextDate(
                            image: nextDate.petPicture as String,
                            petName: nextDate.petName as String,
                            petBreed: nextDate.petBreed as String,
                            motivo: nextDate.reason as String,
                            userName: nextDate.userName as String,
                            userPhone: nextDate.userPhone as String,
                            firstPush: true,
                            secondPush: false,
                          )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        listaEvent.length == 0
                            ? const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child:
                                    Center(child: Text('No tiene registros')),
                              )
                            : const SizedBox(height: 0),
                        for (var event in listaEvent)
                          EventNote(
                            color: Colors.blueGrey,
                            title: event.title as String,
                            time: event.time as String,
                            members: event.members as String,
                            description: event.description as String,
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
