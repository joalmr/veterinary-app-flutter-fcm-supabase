import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/forms/dateForm.dart';
import 'package:vet_app/components/forms/timeForm.dart';
import 'package:vet_app/src/calendar/domain/calendarController.dart';
import 'calendar/calendarEventView.dart';

class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      builder: (_){
        return Scaffold(
          drawer: MenuDrawer(),
          appBar: AppBar(
            title: Text('Calendario'),
            actions: [
              IconButton(
                icon: Icon(Icons.add_circle_outline_rounded),
                onPressed: () {
                  showDialog(
                    context: context,
                    useSafeArea: true,
                    builder: (context) => AlertDialog(
                      scrollable: true,
                      content: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Agregar evento',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Título'),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                            SizedBox(height: 15),
                            Text('Fecha'),
                            dateForm(),
                            SizedBox(height: 5),
                            Text('Hora'),
                            timeForm(),
                            SizedBox(height: 15),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Integrantes'),
                              textCapitalization: TextCapitalization.words,
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Descripción'),
                              textCapitalization: TextCapitalization.sentences,
                              maxLength: 150,
                              maxLines: 5,
                            ),
                            SizedBox(height: 5),
                            SizedBox(
                              width: double.infinity,
                              child: btnPrimary(
                                text: 'Agregar',
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: CalendarEventView(),
        );
      },
    );
  }
}
