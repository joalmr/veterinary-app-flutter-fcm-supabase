import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/calendar/domain/calendarController.dart';
import 'package:vet_app/src/calendar/presentation/widgets/fullCalendar.dart';
import 'package:vet_app/resources/utils/monthsName.dart';

class CalendarEventView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(
      builder: (_) {
        return _.cargando.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 20),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_left_rounded),
                            onPressed: _.monthLess,
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '''${monthsName[_.valueMonth.value]}, ${_.valueYear.value}''',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_right_rounded),
                            onPressed: _.monthMore,
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                      SizedBox(height: 15),
                      FullCalendar(),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
