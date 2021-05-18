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

  const DayDetail({this.day, this.listaBooking, this.listaEvent, this.listaNextDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(day),
      ),
      body: 
      
      DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
              indicatorColor: colorMain,
              labelColor: colorMain,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black54,
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.normal),
              tabs: [
                Tab(text: "Atenciones"),
                Tab(text: "Próximas citas"),
                Tab(text: "Otros eventos"),
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
                          child: Center(child: Text('No tiene registros')),
                        )
                        : SizedBox(height: 0),
                        for (var booking in listaBooking)
                          EventBooking(
                            color: colorBlue,//TODO: cambiar color con el status
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
                        listaNextDate.length == 0 
                        ? Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Center(child: Text('No tiene registros')),
                        )
                        : SizedBox(height: 0),
                        for (var nextDate in listaNextDate)
                          EventNextDate(
                            image: nextDate.petPicture,
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
                        listaEvent.length == 0 
                        ? Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Center(child: Text('No tiene registros')),
                        )
                        : SizedBox(height: 0),
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